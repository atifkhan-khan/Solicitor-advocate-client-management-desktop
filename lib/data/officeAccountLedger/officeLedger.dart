
import 'package:hive/hive.dart';

part 'officeLedger.g.dart';


@HiveType(typeId: 3)
class OfficeLedgersDataModel {
  @HiveField(0)
  int userFormID = 0;

  @HiveField(1)
  int ledgerID = 0;

  @HiveField(2)
  int amount = 0;

  @HiveField(3)
  String status = "";

  @HiveField(4)
  String dateTime ="" ;

  OfficeLedgersDataModel({required this.userFormID, required this.ledgerID, required this.amount, required this.status,required this.dateTime});
}
