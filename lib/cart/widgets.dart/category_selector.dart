import 'package:camp_app/cart/controllers/selector_controller.dart';
import 'package:camp_app/cart/models/category.dart';
import 'package:camp_app/cart/services/categories/all_category_repository.dart';
import 'package:camp_app/cart/services/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item_widget.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  bool selected = false;

  final List<Category> categories = List.from(CategoryRepository.categories);

  late final List<CategoryItem> items;

  @override
  void initState() {
    final allSubcats = AllCategoryRepository().allCategory;
    categories.add(allSubcats);

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

class CategoryItem {
  final String title;
  final IconData iconData;

  CategoryItem({
    required this.title,
    required this.iconData,
  });
}
