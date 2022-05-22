
import 'dart:async';

import 'package:flutter/material.dart';

class AchivmentController {
  final StreamController<bool> isEventExistController = StreamController();
  final StreamController<int> stepsController = StreamController.broadcast();
  final StreamController<bool> openCloseDialogController = StreamController();
  final StreamController<bool> startShow = StreamController();

  late final AnimationController buttonScaleController;

  void init() {
    final stepStream = Stream.periodic(Duration(seconds: 1), (i) => 5 - i);
    final stepSubs = stepStream.listen((event) {
      stepsController.add(event);
    });
    stepsController.stream.listen((event) async {
      if (event == 0) {
        stepSubs.cancel();

        await buttonScaleController.reverse();
        await Future.delayed(Duration(milliseconds: 50));
        openCloseDialogController.add(true);
        await Future.delayed(Duration(seconds: 3));
        openCloseDialogController.add(false);
        await Future.delayed(Duration(milliseconds: 50));
        await buttonScaleController.forward();
        await Future.delayed(Duration(seconds: 3));

        await buttonScaleController.reverse();
        await Future.delayed(Duration(milliseconds: 50));
        startShow.add(true);
        await Future.delayed(Duration(seconds: 3));
        startShow.add(false);

        await Future.delayed(Duration(milliseconds: 50));
        await buttonScaleController.forward();
        await Future.delayed(Duration(milliseconds: 50));
        isEventExistController.add(false);
      }
    });
  }
}
