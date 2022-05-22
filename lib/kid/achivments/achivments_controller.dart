import 'dart:async';

import 'package:flutter/material.dart';

class AchivmentController {
  final StreamController<bool> isEventExistController =
      StreamController.broadcast();
  final StreamController<int> stepsController = StreamController.broadcast();
  final StreamController<bool> openCloseDialogController =
      StreamController.broadcast();
  final StreamController<bool> startShow = StreamController();

  late AnimationController buttonScaleController;

  void dispose() {
    // buttonScaleController = null;
  }

  void init() {
    final stepStream = Stream.periodic(Duration(seconds: 1), (i) => 15 - i);
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
        await Future.delayed(Duration(seconds: 5));
        isEventExistController.add(false);
        startShow.add(false);
      }
    });
  }
}
