import 'package:camp_app/core/models/user.dart';
import 'package:flutter/foundation.dart';

class UserService with ChangeNotifier {
  User? _user;

  void createUser(User? user) {
    _user = user;
  }

  void deleteUser() {
    _user = null;
  }

  User? get user => _user;

  bool get hasUser => _user != null;
}
