// ignore: implementation_imports

import 'package:camp_app/core/enums/role.dart';
import 'package:camp_app/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserService {
  static const _idKey = 'id_key';
  static const _nameKey = 'name_key';
  static const _emailKey = 'email_key';
  static const _phoneKey = 'phone_key';
  static const _roleKey = 'role_key';

  static const _cashKey = 'cash_key';

  final SharedPreferences prefs;

  LocalUserService(this.prefs);

  bool get isUserSaved {
    bool isIdSaved = prefs.getInt(_idKey) != null;
    bool isNameSaved = prefs.getString(_nameKey) != null;
    bool isEmailSaved = prefs.getString(_emailKey) != null;
    bool isPhoneSaved = prefs.getString(_phoneKey) != null;
    bool isRoleSaved = prefs.getString(_roleKey) != null;

    bool isCashSaved = prefs.getDouble(_cashKey) != null;

    return isIdSaved && isNameSaved && isEmailSaved && isPhoneSaved && isRoleSaved && isCashSaved;
  }

  User? getLocalUser() {
    if (isUserSaved) {
      final id = prefs.getInt(_idKey)!;
      final name = prefs.getString(_nameKey)!;
      final email = prefs.getString(_emailKey)!;
      final phone = prefs.getString(_phoneKey)!;
      final role = roleFromString(prefs.getString(_roleKey)!);
      final cash = prefs.getDouble(_cashKey)!;

      return User(
        id: id,
        name: name,
        email: email,
        phone: phone,
        role: role,
        cash: cash,
      );
    }
    return null;
  }

  void clear() {
    prefs.remove(_idKey);
    prefs.remove(_nameKey);
    prefs.remove(_emailKey);
    prefs.remove(_phoneKey);
    prefs.remove(_roleKey);
    prefs.remove(_cashKey);
  }
}
