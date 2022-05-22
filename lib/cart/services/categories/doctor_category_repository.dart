import 'package:camp_app/cart/models/category.dart';
import 'package:camp_app/cart/models/service.dart';
import 'package:camp_app/cart/models/subcategory.dart';
import 'package:flutter/material.dart';

class DoctorCategoryRepository {
  static const doctorCategory = Category(title: 'Медицинские услуги', iconData: Icons.local_hospital, subcategories: [
    _doctorSubcategory1,
    _doctorSubcategory2,
    _doctorSubcategory3,
    _doctorSubcategory4,
    _doctorSubcategory5,
    _doctorSubcategory6,
    _doctorSubcategory7,
  ]);

  static const _doctorServices1 = [
    // заболевания опорно-двиг аппарата
    Service(title: 'прием врача(первичный)'),
    Service(title: 'прием врача(повторный)'),
    Service(title: 'биохимический анализ крови по показателям'),
    Service(title: 'ЛФК'),
    Service(title: 'сауна'),
    Service(title: 'бассейн'),
  ];

  static const _doctorServices2 = [
    // заболевания органов дыхания
    Service(title: 'прием врача(первичный)'),
    Service(title: 'прием врача(повторный)'),
    Service(title: 'биохимический анализ крови по показателям'),
    Service(title: 'ЛФК'),
    Service(title: 'массаж'),
    Service(title: 'грязелечение'),
    Service(title: 'ЭКГ'),
  ];

  static const _doctorServices3 = [
    // заболевания нервной системы
    Service(title: 'прием врача(первичный)'),
    Service(title: 'прием врача(повторный)'),
    Service(title: 'электролечение по показаниям'),
    Service(title: 'ЛФК'),
    Service(title: 'массаж'),
    Service(title: 'РЭГ'),
  ];

  static const _doctorServices4 = [
    // заболевания лор органов
    Service(title: 'прием врача(первичный)'),
    Service(title: 'прием врача(повторный)'),
    Service(title: 'общий анализ крови'),
    Service(title: 'общий анализ мочи'),
    Service(title: 'грязелечение'),
    Service(title: 'ванны'),
    Service(title: 'галотерапия'),
  ];

  static const _doctorSubcategory1 = Subcategory(
    title: 'заболевания опорно-двигательного аппарата',
    services: _doctorServices1,
  );

  static const _doctorSubcategory2 = Subcategory(
    title: 'заболевания органов дыхания',
    services: _doctorServices2,
  );

  static const _doctorSubcategory3 = Subcategory(
    title: 'заболевания нервной системы',
    services: _doctorServices3,
  );

  static const _doctorSubcategory4 = Subcategory(
    title: 'заболевания лор органов',
    services: _doctorServices4,
  );

  static const _doctorSubcategory5 = Subcategory(
    title: 'заболевания желудочно-кишечного тракта',
    services: _doctorServices4,
  );

  static const _doctorSubcategory6 = Subcategory(
    title: 'заболевания эндокринной системы',
    services: _doctorServices4,
  );

  static const _doctorSubcategory7 = Subcategory(
    title: 'заболевания кожи',
    services: _doctorServices4,
  );
}
