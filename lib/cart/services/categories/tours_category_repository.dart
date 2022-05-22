import 'package:camp_app/cart/models/category.dart';
import 'package:camp_app/cart/models/service.dart';
import 'package:camp_app/cart/models/subcategory.dart';
import 'package:flutter/material.dart';

class ToursCategoryRepository {
  static const toursCategory = Category(title: 'Экскурсии', iconData: Icons.tour, subcategories: [
    _subcategory1,
    _subcategory2,
    _subcategory3,
    _subcategory4,
  ]);

  static const _services1 = [
    Service(title: 'Научная выставка'),
    Service(title: 'Изобразительное искусство'),
  ];

  static const _services2 = [
    Service(title: 'Пикник'),
    Service(title: 'На пляж'),
    Service(title: 'Квадроцикл'),
  ];

  static const _services3 = [
    Service(title: 'На пляж'),
    Service(title: 'Нырять с аквалангом'),
    Service(title: 'Гидроци́кл'),
  ];

  static const _services4 = [
    Service(title: 'пройтись по достопримечательностям'),
    Service(title: 'Кинотеатр'),
    Service(title: 'Театр'),
  ];

  static const _subcategory1 = Subcategory(
    title: 'учебная экскурсия',
    services: _services1,
  );

  static const _subcategory2 = Subcategory(
    title: 'На природу',
    services: _services2,
  );

  static const _subcategory3 = Subcategory(
    title: 'На море',
    services: _services3,
  );

  static const _subcategory4 = Subcategory(
    title: 'По городу',
    services: _services4,
  );
}

// спорт, языки
