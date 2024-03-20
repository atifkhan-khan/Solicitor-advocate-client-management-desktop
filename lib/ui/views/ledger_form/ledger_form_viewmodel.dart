import 'package:flutter/cupertino.dart';
import 'package:flutter_desktop_app_advocate/data/ledgersDataModel.dart';
import 'package:flutter_desktop_app_advocate/services/hive_d_b_service.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class LedgerFormViewModel extends BaseViewModel with Initialisable {
  final navigationService = locator<NavigationService>();
  final hiveDBService = locator<HiveDBService>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController countController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  String name = '';

  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  //late final Box box;

  @override
  void initialise() {
    print("Initialise form");
  }

  addLedgerForm() {
    int count = int.parse(countController.text);
    /* ledgersData.name = nameController.text;
    ledgersData.amount = count;
    ledgersData.description = descriptionController.text;*/
    // int id = DateTime.now().millisecondsSinceEpoch;
    int id = 33;

    LedgersData ledgersData = LedgersData(

        formID: UniqueKey().hashCode,
        name: nameController.text.toString(),
        amount: count,
        description: descriptionController.text.toString());
    hiveDBService.addLedger(id, ledgersData);
    navigationService.back();
    // final box = Hive.box<String>("ledgerBox");
    /* name = box.get("name")!;
    print("ledger name: ${name}");*/
    notifyListeners();
  }
}
