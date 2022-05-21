import 'package:camp_app/cart/models/subcategory.dart';
import 'package:flutter/material.dart';

class Category {
  final String title;
  final List<Subcategory> subcategories;
  final IconData iconData;

  const Category({
    required this.title,
    required this.subcategories,
    required this.iconData,
  });
}
