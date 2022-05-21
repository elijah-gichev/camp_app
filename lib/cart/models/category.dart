import 'package:camp_app/cart/models/subcategory.dart';

class Category {
  final String title;
  final List<Subcategory> subcategories;
  const Category({
    required this.title,
    required this.subcategories,
  });
}
