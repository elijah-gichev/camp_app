import 'package:camp_app/cart/services/categories/doctor_category_repository.dart';
import 'package:camp_app/cart/services/categories/languages_category_repository.dart';
import 'package:camp_app/cart/services/categories/sport_category_repository.dart';
import 'package:camp_app/cart/services/categories/tours_category_repository.dart';

class CategoryRepository {
  static const doctor = DoctorCategoryRepository.doctorCategory;
  static const languages = LanguagesCategoryRepository.languagesCategory;
  static const sport = SportCategoryRepository.sportsCategory;
  static const tours = ToursCategoryRepository.toursCategory;
  static const categories = [doctor, languages, sport, tours];
}
