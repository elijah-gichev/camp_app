import 'dart:convert';

import 'package:camp_app/core/enums/role.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final Role role;

  final double cash;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.cash,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    Role? role,
    double? cash,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      cash: cash ?? this.cash,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role..toApiString(),
      'cash': cash,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      role: roleFromString(map['role']),
      cash: map['cash']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, role: $role, cash: $cash)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id && other.name == name && other.email == email && other.phone == phone && other.role == role && other.cash == cash;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ phone.hashCode ^ role.hashCode ^ cash.hashCode;
  }
}
