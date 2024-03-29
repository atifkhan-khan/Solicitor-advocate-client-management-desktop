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

  @HiveField(4)
  String dateTime ='' ;

  LedgersData({required this.formID, required this.name, required this.amount, required this.description,required this.dateTime});
}
