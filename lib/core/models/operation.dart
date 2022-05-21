import 'dart:convert';

import 'package:camp_app/core/models/shop.dart';
import 'package:camp_app/core/models/user.dart';

class Operation {
  final int id;
  final double sum;

// @JsonKey(fromJson: MyDateUtils.dateFromJson, toJson: MyDateUtils.dateToJson)
  final DateTime created_at;

// @JsonKey(includeIfNull: false)
  final User buyer;

  final Shop shop;

  bool showAppearAnim = false;

  Operation(
    this.id,
    this.sum,
    this.created_at,
    this.buyer,
    this.shop,
  );

  Operation copyWith({
    int? id,
    double? sum,
    DateTime? created_at,
    User? buyer,
    Shop? shop,
  }) {
    return Operation(
      id ?? this.id,
      sum ?? this.sum,
      created_at ?? this.created_at,
      buyer ?? this.buyer,
      shop ?? this.shop,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sum': sum,
      'created_at': created_at.millisecondsSinceEpoch/1000,
      'buyer': buyer.toMap(),
      'shop': shop.toMap(),
    };
  }

  factory Operation.fromMap(Map<String, dynamic> map) {
    return Operation(
      map['id']?.toInt() ?? 0,
      map['sum']?.toDouble() ?? 0.0,
      DateTime.fromMillisecondsSinceEpoch(map['created_at']*1000),
      User.fromMap(map['buyer']),
      Shop.fromMap(map['shop']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Operation.fromJson(Map<String, dynamic> source) => Operation.fromMap(source);

  @override
  String toString() {
    return 'Operation(id: $id, sum: $sum, created_at: $created_at, buyer: $buyer, shop: $shop)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Operation && other.id == id && other.sum == sum && other.created_at == created_at && other.buyer == buyer && other.shop == shop;
  }

  @override
  int get hashCode {
    return id.hashCode ^ sum.hashCode ^ created_at.hashCode ^ buyer.hashCode ^ shop.hashCode;
  }
}
