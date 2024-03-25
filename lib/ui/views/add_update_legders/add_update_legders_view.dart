import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_advocate/ui/common/app_colors.dart';
import 'package:flutter_desktop_app_advocate/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../../data/userForm/ledgersDataModel.dart';
import 'add_update_legders_viewmodel.dart';

class AddUpdateLegdersView extends StackedView<AddUpdateLegdersViewModel> {
  LedgersData ledgersData ;

   AddUpdateLegdersView({Key? key,required this.ledgersData}) : super(key: key);

   @override
  void onViewModelReady(AddUpdateLegdersViewModel viewModel) {
     //viewModel.ledgersData = LedgersData(formID: 0, name: '', amount: 0, description: '');
     viewModel.ledgersData = ledgersData;
     viewModel.getUserLedgers();
     viewModel.getOfficeLedgers();
     viewModel.notifyListeners();
     super.onViewModelReady(viewModel);
  }


  @override
  Widget builder(
    BuildContext context,
    AddUpdateLegdersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      viewModel.navService.back();
                    },
                    icon: Icon(Icons.close))
              ],
            ),
            Container(
              child: Text(
                '${viewModel.ledgersData.name} Ledger Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Client Account"),
                    verticalSpaceSmall,
                    Container(
                      width: screenWidth(context) / 2.5,
                      height: screenHeight(context) / 1.8,
                      color: Colors.blueGrey,
                      child: ListView.builder(
                          itemCount: viewModel.listOfUserLedgers.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 22),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${viewModel.listOfUserLedgers[index].status}: ${viewModel.listOfUserLedgers[index].status=='IN' ? '+':'-' } ${viewModel.listOfUserLedgers[index].amount.toString()}£",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "Description",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text("Date: ${viewModel.cdate}",
                                          style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  Divider(thickness: 2,),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Total: ${viewModel.totalInClientAccount.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 90, height: 35,
                            margin: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: kcLightGrey,
                              borderRadius: BorderRadius.all(Radius.circular(8),)
                            ),
                            child: TextField(
                              controller: viewModel.clientTextController,
                              textAlign: TextAlign.center,
                            )),
                        horizontalSpaceMedium,
                        Container(
                          decoration: BoxDecoration(
                              color: kcLightGrey,
                              borderRadius: BorderRadius.all(Radius.circular(8),)
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              viewModel.addLedgerForm("IN");
                            },
                            child: Text('IN'),
                          ),
                        ),
                        horizontalSpaceSmall,
                        Container(
                          decoration: BoxDecoration(
                              color: kcLightGrey,
                              borderRadius: BorderRadius.all(Radius.circular(8),)
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              viewModel.addLedgerForm("Out");
                              viewModel.addOfficeForm("IN");
                            },
                            child: Text('OUT'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                horizontalSpaceSmall,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Office Account"),
                    verticalSpaceSmall,
                    Container(
                      width: screenWidth(context) / 2.5,
                      height: screenHeight(context) / 1.8,
                      color: Colors.blueGrey,
                      child: ListView.builder(
                          itemCount: viewModel.listOfOfficeLedgers.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 22),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${viewModel.listOfOfficeLedgers[index].status}: ${viewModel.listOfOfficeLedgers[index].status=='IN' ? '+':'-' } ${viewModel.listOfOfficeLedgers[index].amount.toString()}£",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "Description",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text("Date: ${viewModel.cdate}",
                                          style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  Divider(thickness: 2,),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Total: ${viewModel.officeTotalInClientAccount.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 90, height: 35,
                            margin: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                                color: kcLightGrey,
                                borderRadius: BorderRadius.all(Radius.circular(8),)
                            ),
                            child: TextField(
                              controller: viewModel.officeTextController,
                              textAlign: TextAlign.center,
                            )),
                        horizontalSpaceMedium,
                        Container(
                          decoration: BoxDecoration(
                              color: kcLightGrey,
                              borderRadius: BorderRadius.all(Radius.circular(8),)
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              viewModel.addOfficeForm("Out");
                            },
                            child: Text('OUT'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  AddUpdateLegdersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddUpdateLegdersViewModel();
}
