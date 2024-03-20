import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_advocate/app/app.router.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'client_account_viewmodel.dart';

class ClientAccountView extends StackedView<ClientAccountViewModel> {
  const ClientAccountView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(ClientAccountViewModel viewModel) {
    // TODO: implement onViewModelReady
    viewModel.hiveDBService.getLedgers();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    ClientAccountViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          children: [
            Text(
              'CLIENT ACCOUNT',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                chipsStatus(viewModel),
                Container(
                    margin: EdgeInsets.only(right: 40),
                    decoration: BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(80))),
                    child: TextButton.icon(
                        onPressed:
                            viewModel.navService.navigateToLedgerFormView,
                        icon: Icon(
                          Icons.add,
                          color: kcBackgroundColor,
                        ),
                        label: Text(
                          'Add Ledgers',
                          style: TextStyle(color: kcBackgroundColor),
                        ))
                ),
              ],
            ),
            verticalSpaceMedium,
            IntrinsicGridView.vertical(
                verticalSpace: 6,
                columnCount: 4,
                horizontalSpace: 3,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                children:
                    List.generate(viewModel.listOfLedgers.length, (index) {
                  return Container(
                    width: 100,
                    //height: 50,
                    child: InkWell(
                      onTap: (){
                        viewModel.navService.navigateToAddUpdateLegdersView();
                      },
                      child: Card(
                        color: kcLightGrey,
                        child: ListTile(
                          title: Text(viewModel.listOfLedgers[index].name),
                          subtitle:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Amount: ${viewModel.listOfLedgers[index].amount.toString()}£"),
                                  Text(viewModel.listOfLedgers[index].description),
                                ],
                              ),
                        ),
                      ),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }

  @override
  ClientAccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ClientAccountViewModel();
}

Widget chipsStatus(ClientAccountViewModel model) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          spacing: 8.0,
          children: List<Widget>.generate(
            model.chipsList.length,
            (int index) {
              return ChoiceChip(
                elevation: 3,
                labelStyle: model.isChipSelected
                    ? TextStyle(color: Colors.white)
                    : TextStyle(color: Colors.black),
                backgroundColor: Colors.white,
                selectedColor: kcPrimaryColor,
                label: Text(
                  '${model.chipsList[index]}',
                ),
                selected: model.chipSelectedValue == index,
                onSelected: (bool selected) {
                  model.chipSelectedValue = selected ? index : 0;
                  model.selectedchip(index);
                  if (model.chipSelectedValue == 0) {
                    // model.getUserOrders("any");
                  } else if (model.chipSelectedValue == 1) {
                    //  model.getUserOrders("processing");
                  } else if (model.chipSelectedValue == 2) {
                    //  model.getUserOrders("completed");
                  }
                },
              );
            },
          ).toList(),
        ),
      ],
    ),
  );
}
