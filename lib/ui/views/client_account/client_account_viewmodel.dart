import 'package:flutter_desktop_app_advocate/app/app.router.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../data/userForm/ledgersDataModel.dart';
import '../../../services/hive_d_b_service.dart';

class ClientAccountViewModel extends BaseViewModel with Initialisable {
  final navService = locator<NavigationService>();
  final hiveDBService = locator<HiveDBService>();

  List<LedgersData> listOfLedgers = [];

  bool isChipSelected = false;
  int chipSelectedValue = 0;

  List<String> chipsList = ["Ledgers", "Reconcilliation"];

  @override
  void initialise() {
    hiveDBService.openDB();
    getAllLedgers();
    //listOfLedgers = hiveDBService.getLedgers();
    // print(listOfLedgers.toString());
  }

  getAllLedgers() async {
    listOfLedgers = await hiveDBService.getLedgers();
    notifyListeners();
  }

  selectedchip(int chip) {
    chipSelectedValue = chip;
    notifyListeners();
  }

  navToLedgerForm() {
    navService.navigateToLedgerFormView();
  }
}
