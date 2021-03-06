import 'package:camp_app/cart/widgets.dart/category_selector.dart';
import 'package:camp_app/kid/main/ui/kid_main_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({
    Key? key,
    required this.index,
    required this.category,
    required this.onSelected,
    required this.isSelected,
  }) : super(key: key);

  final CategoryItem category;
  final bool isSelected;
  final void Function(int) onSelected;
  final int index;

  @override
  State<StatefulWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
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
                left: 20.w,
                right: 8.w,
              ),
              child: Container(
                height: 70.r,
                width: 70.r,
                decoration: BoxDecoration(
                  color: widget.isSelected ? KidTheme.of(context).buttonColor : KidTheme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    widget.category.iconData,
                    color: widget.isSelected ? KidTheme.of(context).buttonTextColor : Colors.black, //KidTheme.of(context)
                  ),
                  // child: SvgPicture.asset(
                  //   widget.category.iconPath,
                  //   color: widget.isSelected ? Colors.white : Colors.black,
                  // ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: KidTheme.of(context).buttonTextColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
