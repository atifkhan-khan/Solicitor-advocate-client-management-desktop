import 'package:flutter_desktop_app_advocate/ui/views/ledger_form/ledger_form_view.dart';
import 'package:hive/hive.dart';

import '../data/ledgersDataModel.dart';

class HiveDBService {
  Future openDB() async {
    return await Hive.openBox<LedgersData>('ledgerForm');
  }

  Future addLedger(int id, LedgersData ledgersData) async {
    print("ledgers: ${ledgersData.name.toString()}");

    final box = Hive.box<LedgersData>("ledgerForm");
    await box.add(ledgersData);
    //getLedgers();
    // final boxs = box.get("ledgerBox");
    // print(boxs?.name.toString());
  }

  Future<List<LedgersData>> getLedgers() async {
    await Hive.openBox<LedgersData>('ledgerForm');
    final box = await Hive.box<LedgersData>("ledgerForm");
    //print("${box.values.toList()}");
    return box.values.toList();
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
