import 'package:camp_app/cart/models/service.dart';

class Subcategory {
  final String title;
  final List<Service> services;
  const Subcategory({
    required this.title,
    required this.services,
  });
}
