import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../main/ui/kid_main_page.dart';
import '../widgets/kid_achivments.dart';
import 'achivments_controller.dart';

class TreasureCard extends HookWidget {
  final AchivmentController achivmentController;

  TreasureCard({
    Key? key,
    required this.achivmentController,
  }) : super(key: key);
  TickerFuture? buttonPressedState;

  @override
  Widget build(BuildContext context) {
    final scaleController = useAnimationController(
      lowerBound: 0.9,
      upperBound: 1,
      initialValue: 1,
      duration: Duration(milliseconds: 100),
    );

    useEffect(() {
      achivmentController.buttonScaleController = scaleController;
    }, []);
    useAnimation(scaleController);

    return IntrinsicWidth(
      child: Transform.scale(
        scale: scaleController.value,
        child: Transform.rotate(
          angle: -0.05,
          child: GestureDetector(
            onTapDown: (_) {
              buttonPressedState = scaleController.reverse();
            },
            onTapUp: (_) async {
              await buttonPressedState;
              buttonPressedState = scaleController.forward();
            },
            onTap: () async {
              await buttonPressedState;
            },
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: KidTheme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          KidTheme.of(context).buttonTextColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset.zero,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Поиск сундука (3)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: KidTheme.of(context).cardTextColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            StreamBuilder(
                              stream:
                                  achivmentController.stepsController.stream,
                              initialData: 15,
                              builder: (context, snapshot) {
                                return Text(
                                  '${snapshot.data}м',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: KidTheme.of(context).cardTextColor,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Spacer(),
                        TreasureImage(
                          size: 77,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AchivmentButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
