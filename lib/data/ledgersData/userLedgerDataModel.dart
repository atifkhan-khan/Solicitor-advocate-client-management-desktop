
import 'package:hive/hive.dart';

part 'userLedgerDataModel.g.dart';


@HiveType(typeId: 2)
class UserLedgersDataModel {
  @HiveField(0)
  int userFormID = 0;

  @HiveField(1)
  int ledgerID = 0;

  @HiveField(2)
  int amount = 0;

  @HiveField(3)
  String status = "";

  @HiveField(4)
  String dateTime ;

  UserLedgersDataModel({required this.userFormID, required this.ledgerID, required this.amount, required this.status,required this.dateTime});
}
