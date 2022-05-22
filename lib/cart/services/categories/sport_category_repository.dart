import 'package:camp_app/cart/models/category.dart';
import 'package:camp_app/cart/models/service.dart';
import 'package:camp_app/cart/models/subcategory.dart';
import 'package:flutter/material.dart';

class SportCategoryRepository {
  static const sportsCategory = Category(title: 'Спорт', iconData: Icons.sports_handball, subcategories: [
    _subcategory1,
    _subcategory2,
    _subcategory3,
  ]);

  static const _services1 = [
    Service(title: 'футбол'),
    Service(title: 'баскетбол'),
    Service(title: 'теннис'),
  ];

  static const _services2 = [
    Service(title: 'Шашки'),
    Service(title: 'Шахматы'),
    Service(title: 'Домино'),
  ];

  static const _services3 = [
    Service(title: 'Нырять с аквалангом'),
    Service(title: 'Гидроци́кл'),
  ];

  static const _subcategory1 = Subcategory(
    title: 'Активный спорт',
    services: _services1,
  );

  static const _subcategory2 = Subcategory(
    title: 'Интеллектуальный спорт',
    services: _services2,
  );

  static const _subcategory3 = Subcategory(
    title: 'Водный спорт',
    services: _services3,
  );
}

// языки
