import 'package:camp_app/cart/controllers/selector_controller.dart';
import 'package:camp_app/cart/models/category.dart';
import 'package:camp_app/cart/models/subcategory.dart';
import 'package:camp_app/cart/services/children_category_repository.dart';
import 'package:camp_app/cart/widgets.dart/category_selector.dart';
import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item_widget.dart';

class ChildrenCategorySelector extends StatefulWidget {
  const ChildrenCategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  _ChildrenCategorySelectorState createState() => _ChildrenCategorySelectorState();
}

class _ChildrenCategorySelectorState extends State<ChildrenCategorySelector> {
  bool selected = false;

  final List<Category> categories = ChildrenCategoryRepository.categories;

  late List<CategoryItem> items;

  late KidThemeData kidThemeData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    items = categories
        .map(
          (c) => CategoryItem(title: c.title, iconData: c.iconData),
        )
        .toList();
    super.didChangeDependencies();

    kidThemeData = KidTheme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Center(
            child: CategoryItemWidget(
              index: index,
              category: items[index],
              isSelected: context.watch<SelectorController>().isSelectedIndex(index),
              onSelected: context.read<SelectorController>().selectCategory,
            ),
          );
        },
      ),
    );
  }
}
