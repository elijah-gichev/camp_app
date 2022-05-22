import 'package:camp_app/cart/controllers/selector_controller.dart';
import 'package:camp_app/cart/models/category.dart';
import 'package:camp_app/cart/services/categories/all_category_repository.dart';
import 'package:camp_app/cart/services/category_repository.dart';
import 'package:camp_app/cart/services/children_category_repository.dart';
import 'package:camp_app/cart/widgets.dart/children_category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_card.dart';

class ChildrenListOfSubCategories extends StatefulWidget {
  const ChildrenListOfSubCategories({Key? key}) : super(key: key);

  @override
  State<ChildrenListOfSubCategories> createState() => _ChildrenListOfSubCategoriesState();
}

class _ChildrenListOfSubCategoriesState extends State<ChildrenListOfSubCategories> {
  final List<Category> categories = List.from(ChildrenCategoryRepository.categories);

  @override
  void initState() {
    final allSubcats = AllCategoryRepository().allCategory;
    categories.add(allSubcats);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectorController>(
      builder: (context, controleler, widget) {
        final index = controleler.selectedIndex;

        return Column(
          children: [
            ...categories[index].subcategories.map(
              (cart) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ChildrenCategoryCard(
                    name: cart.title,
                    reaction: '😆',
                    isRecommended: true,
                    imagePath: 'assets/images/image1.png',
                    onTap: () {},
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
