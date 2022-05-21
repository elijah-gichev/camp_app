import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:camp_app/core/constants/app_strings.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class OperationView extends StatefulWidget {
  final Operation operation;

  const OperationView({Key? key, required this.operation}) : super(key: key);

  @override
  State<OperationView> createState() => _OperationViewState();
}

class _OperationViewState extends State<OperationView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant OperationView oldWidget) {
    _controller.reset();
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Color color;
    String value = "";
    final DateFormat formatter = DateFormat('HH:mm');
    String time = formatter.format(widget.operation.created_at);
    if (widget.operation.sum < 0) {
      value = "${widget.operation.sum}";
      color = AppColors.red;
    } else {
      value = "+${widget.operation.sum}";
      color = AppColors.green;
    }
    String title = "";
    String subtitle = "";
    if (widget.operation.sum > 0) {
      title = AppStrings.parent;
      subtitle = AppStrings.refill;
    } else {
      title = widget.operation.shop.title;
      subtitle = widget.operation.shop.category;
    }
    return FadeTransition(
      opacity: Tween<double>(
        begin: widget.operation.showAppearAnim ? 0 : 1,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      )),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(widget.operation.showAppearAnim ? -1 : 0, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOutCubic,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: AppColors.iconBg,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: const Icon(
                    Icons.ac_unit,
                    size: 20,
                    color: AppColors.darkBlue,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppFonts.medium.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          subtitle,
                          style: AppFonts.regular.copyWith(
                            fontSize: 12,
                            color: const Color.fromRGBO(22, 22, 22, 0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$value₽',
                      style: AppFonts.semibold.copyWith(
                        fontSize: 14,
                        color: color,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      time,
                      style: AppFonts.regular.copyWith(fontSize: 12, color: const Color.fromRGBO(22, 22, 22, 0.4)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
