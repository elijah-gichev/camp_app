import 'package:camp_app/cart/models/category.dart';
import 'package:camp_app/cart/services/categories/doctor_category_repository.dart';
import 'package:camp_app/cart/services/categories/languages_category_repository.dart';
import 'package:camp_app/cart/services/categories/sport_category_repository.dart';
import 'package:camp_app/cart/services/categories/tours_category_repository.dart';
import 'package:flutter/material.dart';

class AllCategoryRepository {
  final allCategory = Category(title: 'Все услуги', iconData: Icons.all_inbox_outlined, subcategories: [
    ...DoctorCategoryRepository.doctorCategory.subcategories,
    ...LanguagesCategoryRepository.languagesCategory.subcategories,
    ...SportCategoryRepository.sportsCategory.subcategories,
    ...ToursCategoryRepository.toursCategory.subcategories,
  ]);
}
