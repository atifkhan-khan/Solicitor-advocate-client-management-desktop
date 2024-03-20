import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'ledgersDataModel.g.dart';

@HiveType(typeId: 1)
class LedgersData {
  @HiveField(0)
  int formID;

  @HiveField(1)
  String name = '';

  @HiveField(2)
  int amount = 0;

  @HiveField(3)
  String description = '';

  LedgersData({required this.formID, required this.name, required this.amount, required this.description});
}
