import 'package:camp_app/cart/controllers/selector_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dish_item.dart';

class DishSelector extends StatefulWidget {
  const DishSelector({
    Key? key,
  }) : super(key: key);

  @override
  _DishSelectorState createState() => _DishSelectorState();
}

class _DishSelectorState extends State<DishSelector> {
  bool selected = false;

  final List<DishCategory> categories = [
    DishCategory(
      title: 'Все',
      iconPath: 'assets/icons/dish1.svg',
    ),
    DishCategory(
      title: 'вторая категория',
      iconPath: 'assets/icons/dish2.svg',
    ),
    DishCategory(
      title: 'третья категория',
      iconPath: 'assets/icons/dish3.svg',
    ),
    DishCategory(
      title: 'четвертая категория',
      iconPath: 'assets/icons/dish4.svg',
    ),
    DishCategory(
      title: 'пятая категория',
      iconPath: 'assets/icons/dish5.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Center(
            child: DishItem(
              index: index,
              category: categories[index],
              isSelected: context.watch<SelectorController>().isSelectedIndex(index),
              onSelected: context.read<SelectorController>().selectCategory,
            ),
          );
        },
      ),
    );
  }
}

class DishCategory {
  final String title;
  final String iconPath;

  DishCategory({
    required this.title,
    required this.iconPath,
  });
}
