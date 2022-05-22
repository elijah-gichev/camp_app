import 'package:camp_app/cart/models/category.dart';
import 'package:camp_app/cart/models/subcategory.dart';
import 'package:flutter/material.dart';

class ChildrenCategoryRepository {
  static const List<Category> categories = [
    Category(
      title: 'Тема',
      iconData: Icons.deck,
      subcategories: [
        Subcategory(
          title: 'Темная тема',
          services: [],
        ),
      ],
    ),
    Category(
      title: 'Достижения',
      iconData: Icons.done,
      subcategories: [
        // Subcategory(
        //   title: 'Темная тема',
        //   services: [],
        // ),
      ],
    ),
    Category(
      title: 'Награды',
      iconData: Icons.verified,
      subcategories: [
        // Subcategory(
        //   title: 'Темная тема',
        //   services: [],
        // ),
      ],
    ),
    Category(
      title: 'Новый функционал',
      iconData: Icons.functions,
      subcategories: [
        // Subcategory(
        //   title: 'Темная тема',
        //   services: [],
        // ),
      ],
    ),
    Category(
      title: 'Все',
      iconData: Icons.all_inbox_outlined,
      subcategories: [
        // Subcategory(
        //   title: 'Темная тема',
        //   services: [],
        // ),
      ],
    ),
  ];
}
