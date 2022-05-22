import 'dart:math';

import 'package:camp_app/core/widgets/animated_icon.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart' hide AnimatedIcon;
import 'package:flutter_hooks/flutter_hooks.dart';

import '../main/ui/kid_main_page.dart';
import '../widgets/shift.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int? currentActiveIcon = 2;

  late ConfettiController _controller;
  late ConfettiController _controller1;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 2));
    _controller1 = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'rate',
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Confetty(
                  direction: 3 * pi / 4,
                  controller: _controller1,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Confetty(
                  controller: _controller,
                  direction: pi / 4,
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MyBackButton(),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 19,
                        bottom: 19,
                      ),
                      child: Text(
                        'Оцените мероприятие: Экскурсия в лес',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: KidTheme.of(context).cardTextColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            5,
                            (index) => RaitingIcon(
                              asset: 'assets/images/rating/${index + 1}.png',
                              isActive: currentActiveIcon == index,
                              onTap: () {
                                if (index == 4) {
                                  _controller.play();
                                  _controller1.play();
                                }
                                setState(() {
                                  currentActiveIcon = index;
                                });
                              },
                            ),
                          ),
                        ),
                        RatingButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Confetty extends StatefulWidget {
  final double direction;
  final ConfettiController controller;

  const Confetty({
    Key? key,
    required this.direction,
    required this.controller,
  }) : super(key: key);

  @override
  State<Confetty> createState() => _ConfettyState();
}

class _ConfettyState extends State<Confetty> {
  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: widget.controller,
      blastDirection: widget.direction, // radial value - LEFT
      particleDrag: 0.05, // apply drag to the confetti
      emissionFrequency: 0.05, // how often it should emit
      numberOfParticles: 20, // number of particles to emit
      gravity: 0.05, // gravity - or fall speed
      shouldLoop: false,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink
      ], // manually specify the colors to be used
    );
  }
}

class RatingButton extends HookWidget {
  const RatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaleController = useAnimationController(
      duration: Duration(seconds: 3),
    );

    scaleController
      ..forward()
      ..repeat();

    useAnimation(scaleController);
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: KidTheme.of(context).buttonColor,
          ),
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  height: 5 * (cos(scaleController.value * 2 * pi) + 1),
                  width: 10 * (cos(scaleController.value * 2 * pi) + 1),
                ),
                Text(
                  "Отправить",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: KidTheme.of(context).buttonTextColor,
                  ),
                ),
                SizedBox(
                  height: 15 * (cos(scaleController.value * 2 * pi) + 1),
                  width: 10 * (cos(scaleController.value * 2 * pi) + 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RaitingIcon extends HookWidget {
  final String asset;
  final bool isActive;
  final Function() onTap;

  const RaitingIcon({
    Key? key,
    required this.isActive,
    required this.asset,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaleController = useAnimationController(
      duration: Duration(seconds: 1),
    );

    scaleController
      ..forward()
      ..repeat();
    final rotateController = useAnimationController(
      duration: Duration(seconds: 1),
    );
    rotateController
      ..forward()
      ..repeat();
    final activeController = useAnimationController(
      duration: Duration(seconds: 1),
    );
    if (isActive) {
      activeController.forward();
    } else {
      activeController.reverse();
      // ..stop()
      // ..reverse();

    }
    // useAnimation(activeController);
    // useAnimation(rotateController);
    useAnimation(scaleController);
    return Transform.rotate(
      angle: 0.07 * cos(rotateController.value * 2 * pi),
      child: Transform.scale(
        scale: 0.1 * cos(scaleController.value * 2 * pi) +
            1 +
            activeController.value,
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: AnimatedIcon(
            asset: asset,
            size: 50,
          ),
        ),
      ),
    );
  }
}
