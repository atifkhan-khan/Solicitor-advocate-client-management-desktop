import 'package:flutter/cupertino.dart';
import 'package:flutter_desktop_app_advocate/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../data/ledgersData/userLedgerDataModel.dart';
import '../../../data/officeAccountLedger/officeLedger.dart';
import '../../../data/userForm/ledgersDataModel.dart';
import '../../../services/hive_d_b_service.dart';

class AddUpdateLegdersViewModel extends BaseViewModel {
  final hiveDBService = locator<HiveDBService>();
  final navService = locator<NavigationService>();
  final dialog = locator<DialogService>();

  TextEditingController clientTextController = new TextEditingController();
  TextEditingController officeTextController = new TextEditingController();
  List<UserLedgersDataModel> listOfUserLedgers = [];
  List<OfficeLedgersDataModel> listOfOfficeLedgers = [];

  late LedgersData ledgersData ;
  int totalInClientAccount = 0;
  int officeTotalInClientAccount = 0;

  DateTime dateTime = DateTime.now();



  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  getUserLedgers() async{
    listOfUserLedgers = await hiveDBService.getUserLedgers(ledgersData.formID);

    totalAmountCalculation();
    notifyListeners();
  }

  getOfficeLedgers() async{
    listOfOfficeLedgers = await hiveDBService.getOfficeLedgers(ledgersData.formID);
    officeTotalAmountCalculation();
    notifyListeners();
  }

  totalAmountCalculation(){
    totalInClientAccount = 0;
    listOfUserLedgers.forEach((element) {
      if(element.status=="IN")
      totalInClientAccount = totalInClientAccount+element.amount;
      else
        totalInClientAccount = totalInClientAccount - element.amount;
    });
    notifyListeners();
  }
  officeTotalAmountCalculation(){
    officeTotalInClientAccount = 0;
    listOfOfficeLedgers.forEach((element) {
      if(element.status=="IN")
        officeTotalInClientAccount = officeTotalInClientAccount+element.amount;
      else
        officeTotalInClientAccount = officeTotalInClientAccount - element.amount;
    });
    notifyListeners();
  }

  addLedgerForm(String status) {
    int count = int.parse(clientTextController.text);
    int userFormID = ledgersData.formID;

    UserLedgersDataModel userLedgersDataModel = UserLedgersDataModel(
        userFormID: userFormID,
        ledgerID: UniqueKey().hashCode,
        amount: count,
        status: status,
        dateTime: cdate,
    );

    if(status=='IN'){
      hiveDBService.addUserLedger(userLedgersDataModel);
    }
    if(status=='Out' && totalInClientAccount >= count){
      addOfficeForm("IN");
      hiveDBService.addUserLedger(userLedgersDataModel);
    }else if(status=='Out') {
      dialog.showDialog(title: 'The transaction amount is more than total');
    }
    getUserLedgers();
    totalAmountCalculation();
    notifyListeners();
  }

  addOfficeForm(String status) {
    int count = 0;
    int officecount = 0;
    if(status =='Out'){
      officecount = int.parse(officeTextController.text.toString());
      notifyListeners();
    }else{
      count = int.parse(clientTextController.text.toString());
      notifyListeners();
    }
    int userFormID = ledgersData.formID;

    OfficeLedgersDataModel officeLedgersDataModel = OfficeLedgersDataModel(
      userFormID: userFormID,
      ledgerID: UniqueKey().hashCode,
      amount: status == 'Out' ? officecount : count,
      status: status,
      dateTime: cdate,
    );
    if(status=='Out' && officeTotalInClientAccount >= officecount){
      hiveDBService.addOfficeLedger(officeLedgersDataModel);
    }else if(status=='Out'){
      dialog.showDialog(title: 'The transaction amount is more than total');
    }
    if(status=='IN')
    hiveDBService.addOfficeLedger(officeLedgersDataModel);

    getOfficeLedgers();
    officeTotalAmountCalculation();
    totalAmountCalculation();
    getUserLedgers();
    notifyListeners();
  }


}
