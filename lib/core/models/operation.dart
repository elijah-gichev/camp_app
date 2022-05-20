
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

  Operation(this.id, this.sum, this.created_at,
      this.buyer, this.shop);
}
