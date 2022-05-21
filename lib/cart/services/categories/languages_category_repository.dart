import 'package:camp_app/cart/models/category.dart';
import 'package:camp_app/cart/models/service.dart';
import 'package:camp_app/cart/models/subcategory.dart';
import 'package:flutter/material.dart';

class LanguagesCategoryRepository {
  static const languagesCategory = Category(title: 'Иностранные языки', iconData: Icons.language, subcategories: [
    _subcategory1,
    _subcategory2,
    _subcategory3,
  ]);

  static const _services1 = [
    Service(title: 'Английский'),
    Service(title: 'Французский'),
    Service(title: 'Немецкий'),
  ];

  static const _services2 = [
    Service(title: 'Арабский'),
    Service(title: 'Китайский'),
    Service(title: 'Японский'),
    Service(title: 'Корейский'),
  ];

  static const _services3 = [
    Service(title: 'Русский'),
    Service(title: 'Белорусский'),
    Service(title: 'Польский'),
  ];

  static const _subcategory1 = Subcategory(
    title: 'Западные языки',
    services: _services1,
  );

  static const _subcategory2 = Subcategory(
    title: 'Восточные языки',
    services: _services2,
  );

  static const _subcategory3 = Subcategory(
    title: 'Славянские языки',
    services: _services3,
  );
}

// языки
