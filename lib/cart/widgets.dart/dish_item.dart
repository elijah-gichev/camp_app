import 'package:camp_app/cart/widgets.dart/dish_selector.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DishItem extends StatefulWidget {
  const DishItem({
    Key? key,
    required this.index,
    required this.category,
    required this.onSelected,
    required this.isSelected,
  }) : super(key: key);

  final DishCategory category;
  final bool isSelected;
  final void Function(int) onSelected;
  final int index;

  @override
  State<StatefulWidget> createState() => _DishItemState();
}

class _DishItemState extends State<DishItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.index);
      },
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 8.w,
                right: 8.w,
              ),
              child: Container(
                height: 70.r,
                width: 70.r,
                decoration: BoxDecoration(
                  color: widget.isSelected ? const Color(0xff98D2F5) : const Color(0xffF2F3F4),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    widget.category.iconPath,
                    color: widget.isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            if (widget.isSelected)
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 72, height: 40),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    widget.category.title,
                    textAlign: TextAlign.center,
                    // style: FinFont.medium
                    //     .copyWith(fontSize: 11, color: FinColor.secondaryText),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
