import 'package:flutter_desktop_app_advocate/data/ledgersData/userLedgerDataModel.dart';
import 'package:flutter_desktop_app_advocate/data/officeAccountLedger/officeLedger.dart';
import 'package:hive/hive.dart';

import '../data/userForm/ledgersDataModel.dart';

class HiveDBService {
  Future openDB() async {
     await Hive.openBox<LedgersData>('ledgerForm');
     await Hive.openBox<UserLedgersDataModel>("addUserLedger");
     await Hive.openBox<OfficeLedgersDataModel>("addOfficeLedger");
  }

  clearDB(){
    final box = Hive.box<LedgersData>("ledgerForm");
    final box1 = Hive.box<UserLedgersDataModel>("addUserLedger");
    final box2 = Hive.box<OfficeLedgersDataModel>("addOfficeLedger");
    box.clear();
    box1.clear();
    box2.clear();
  }

  Future addLedger(LedgersData ledgersData) async {
    print("ledgers: ${ledgersData.name.toString()}");
   // print("ledgers: Date ${ledgersData.dateTime.toString()}");

    final box = Hive.box<LedgersData>("ledgerForm");
    await box.add(ledgersData);

  }

  Future<List<LedgersData>> getLedgers() async {
    await Hive.openBox<LedgersData>('ledgerForm');
    final box = await Hive.box<LedgersData>("ledgerForm");
    return box.values.toList();
  }

  Future addUserLedger(UserLedgersDataModel userLedgersDataModel) async {
    print("addUserLedger: ${userLedgersDataModel.amount.toString()}");

    final box = Hive.box<UserLedgersDataModel>("addUserLedger");
    await box.add(userLedgersDataModel);
  }

 /* Future<List<UserLedgersDataModel>> getUserLedgers() async {
    await Hive.openBox<UserLedgersDataModel>('addUserLedger');
    final box = await Hive.box<UserLedgersDataModel>("addUserLedger");
    return box.values.toList();
  } */

  Future<List<UserLedgersDataModel>> getUserLedgers(int formID) async {
    await Hive.openBox<UserLedgersDataModel>('addUserLedger');
    final box = await Hive.box<UserLedgersDataModel>("addUserLedger");
    return box.values.where((element) => element.userFormID == formID).toList();
  }

  Future addOfficeLedger(OfficeLedgersDataModel officeLedgersDataModel) async {
    print("addofficeLedger: ${officeLedgersDataModel.amount.toString()}");

    final box = Hive.box<OfficeLedgersDataModel>("addOfficeLedger");
    await box.add(officeLedgersDataModel);
  }

  Future<List<OfficeLedgersDataModel>> getOfficeLedgers(int formID) async {
    await Hive.openBox<OfficeLedgersDataModel>('addOfficeLedger');
    final box = await Hive.box<OfficeLedgersDataModel>("addOfficeLedger");
    return box.values.where((element) => element.userFormID == formID).toList();
  }


/*deleteLedgers() {
      Hive.openBox<LedgersData>('ledgerBox1');
     final box =  Hive.box("ledgerBox1");
     box.delete;
     box.clear();
  }*/

  /* void getLedger()async{
    final box = Hive.box<String>("ledgerBox");
    String? name = box.get("name");
    print("name is: ${name}");
    print("Name is:  ${name}");
    return name;
  }*/
}
