import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_advocate/ui/common/app_colors.dart';
import 'package:flutter_desktop_app_advocate/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'ledger_form_viewmodel.dart';

class LedgerFormView extends StackedView<LedgerFormViewModel> {
  const LedgerFormView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(LedgerFormViewModel viewModel) {
    viewModel.hiveDBService.openDB();

    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    LedgerFormViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(top: 15, left: 25.0, right: 25.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      viewModel.navigationService.back();
                    },
                    icon: Icon(Icons.cancel))),
            Center(
                child: Text(
              "Ledger Form",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            verticalSpaceMedium,
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              width: screenWidth(context) / 2,
              decoration: const BoxDecoration(
                  color: kcLightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Client Name ${viewModel.name}'),
                      Text('Date: ${viewModel.cdate}'),
                    ],
                  ),
                  TextField(
                    controller: viewModel.nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter Name',
                    ),
                  ),
                  verticalSpaceSmall,
                  /*Text('Amount'),
                  verticalSpaceSmall,
                  Container(
                    width: 100,
                    height: 40,
                    color: Colors.white,
                    child: TextField(
                      controller: viewModel.countController,
                      decoration: InputDecoration(),
                    ),
                  ),*/
                  verticalSpaceSmall,
                  Text('Ledgers Description'),
                  TextField(
                    controller: viewModel.descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Enter Details',
                    ),
                  ),
                  verticalSpaceMedium,
                  verticalSpaceMedium,
                  MaterialButton(
                    color: kcPrimaryColor,
                    onPressed: () {
                      viewModel.addLedgerForm();
                    },
                    child: Text(
                      'Submit',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  @override
  LedgerFormViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LedgerFormViewModel();
}
