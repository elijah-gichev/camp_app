import 'dart:async';

import 'package:camp_app/boom/boom_event.dart';
import 'package:camp_app/boom/boom_service.dart';
import 'package:camp_app/boom/boom_state.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shake/shake.dart';

class BoomBloc extends Bloc<BoomEvent, BoomState> {
  late ShakeDetector detector;

  final BoomService boomService;
  late final StreamSubscription<DatabaseEvent> subs;
  DatabaseReference bumpedEventsRef = FirebaseDatabase.instance.ref("/bumped");

  BoomBloc(this.boomService) : super(BoomShow()) {
    detector = ShakeDetector.autoStart(
      onPhoneShake: () async {
        try {
          final result = await _determinePosition();
          await boomService.postShake(
            result.longitude,
            result.latitude,
          );
        } catch (e) {
          print(e);
        }
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    subs = bumpedEventsRef
        .orderByChild("date")
        .startAt(DateTime.now().millisecondsSinceEpoch / 1000)
        .onChildAdded
        .listen((DatabaseEvent event) async {
      add(BoomShaked());
    });
    on<BoomShaked>((event, emit) {
      emit(BoomShow());
    });
    on<BoomClicked>((event, emit) {
      emit(BoomHide());
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<void> close() {
    detector.stopListening();
    subs.cancel();
    return super.close();
  }
}
