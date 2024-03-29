import 'package:flutter/cupertino.dart';
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

  TextEditingController searchController = new TextEditingController();

  List<LedgersData> listOfLedgers = [];
  List<LedgersData> searchlistOfLedgers = [];

  bool isChipSelected = false;
  int chipSelectedValue = 0;

  List<String> chipsList = ["Ledgers", "Reconcilliation"];
  String addmembersValue = "";
  String chosenValue = "";



  @override
  void initialise() {
    hiveDBService.openDB();
    getAllLedgers();
    //listOfLedgers = hiveDBService.getLedgers();
    // print(listOfLedgers.toString());
  }

  void addMembers(String text) {
    addmembersValue = text;
    notifyListeners();
  }

  void changeText(String text) {
    chosenValue = text;
    notifyListeners();
  }

  getAllLedgers() async {
    listOfLedgers = await hiveDBService.getLedgers();
    searchlistOfLedgers = listOfLedgers;
    notifyListeners();
  }

  selectedchip(int chip) {
    chipSelectedValue = chip;
    notifyListeners();
  }

  searchUser(String searchText){
    if(searchText.isNotEmpty){
      searchlistOfLedgers = listOfLedgers.where((user) => user.name.toLowerCase().contains(searchText.toLowerCase())).toList();
      notifyListeners();
    }else
      searchlistOfLedgers = listOfLedgers;
    notifyListeners();
    }

  navToLedgerForm() {
    navService.navigateToLedgerFormView();
  }
}
