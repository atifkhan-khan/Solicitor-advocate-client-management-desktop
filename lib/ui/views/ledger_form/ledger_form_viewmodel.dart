import 'package:flutter/cupertino.dart';
import 'package:flutter_desktop_app_advocate/app/app.router.dart';
import 'package:flutter_desktop_app_advocate/data/userForm/ledgersDataModel.dart';
import 'package:flutter_desktop_app_advocate/services/hive_d_b_service.dart';
import 'package:flutter_desktop_app_advocate/ui/views/client_account/client_account_viewmodel.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class LedgerFormViewModel extends BaseViewModel with Initialisable {
  final navigationService = locator<NavigationService>();
  final hiveDBService = locator<HiveDBService>();
   ClientAccountViewModel clientAccountViewModel = ClientAccountViewModel();
  TextEditingController nameController = new TextEditingController();
//  TextEditingController countController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  String name = '';

  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  DateTime dateTime = DateTime.now();
  //late final Box box;

  @override
  void initialise() {
    print("Initialise form");
  }

  addLedgerForm() {
    int id = 33;

    LedgersData ledgersData = LedgersData(

        formID: UniqueKey().hashCode,
        name: nameController.text.toString(),
        amount: id,
        description: descriptionController.text.toString(),
        dateTime: cdate
    );
    hiveDBService.addLedger(ledgersData);
    navigationService.replaceWithClientAccountView();
    // final box = Hive.box<String>("ledgerBox");
    /* name = box.get("name")!;
    print("ledger name: ${name}");*/
    notifyListeners();
  }
}
