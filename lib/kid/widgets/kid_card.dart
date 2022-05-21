import 'dart:math';

import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KidCard extends HookWidget {
  final String title;
  final String? subtitle;
  final Widget? status;
  final VoidCallback? onTap;
  final Widget? action;
  final Widget? icon;
  final EdgeInsets? edgeInsets;
  final KidCardTransformer? kidCardTransformer;

  KidCard({
    Key? key,
    required this.title,
    this.onTap,
    this.status,
    this.kidCardTransformer,
    this.subtitle,
    this.edgeInsets,
    this.action,
    this.icon,
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
    useAnimation(scaleController);

    final bottomPaddingTitle = (action != null) ? 11 : 0;
    return IntrinsicWidth(
      child: Transform.scale(
        scale: scaleController.value,
        child: Transform.rotate(
          angle: kidCardTransformer?.angle ?? 0,
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
              onTap?.call();
            },
            child: Center(
              child: Container(
                padding: edgeInsets ?? const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: KidTheme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kidCardTransformer?.shadowColor ??
                          KidTheme.of(context).buttonTextColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: kidCardTransformer?.shadowOffset == null
                          ? Offset.zero
                          : Offset(
                              sin(4 * pi * kidCardTransformer!.shadowOffset!) *
                                  2,
                              cos(6 * pi * kidCardTransformer!.shadowOffset!) *
                                  2,
                            ),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (status != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: status,
                      ),
                    if (title != 'null')
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: bottomPaddingTitle.toDouble(),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 21,
                                  color: KidTheme.of(context).cardTextColor,
                                ),
                              ),
                            ),
                            if (icon != null) icon!,
                          ],
                        ),
                      ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: KidTheme.of(context).cardTextColor,
                          ),
                        ),
                      ),
                    if (action != null) action!,
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

class KidCardTransformer {
  final double? angle;
  final double? scale;
  final double? shadowOffset;
  final Color? shadowColor;
  final Animation<Offset>? initAnimation;

  KidCardTransformer({
    this.angle,
    this.scale,
    this.shadowOffset,
    this.shadowColor,
    this.initAnimation,
  });
}
