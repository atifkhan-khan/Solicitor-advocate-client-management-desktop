import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_advocate/app/app.router.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../../common/widgets/customDropDown.dart';
import 'client_account_viewmodel.dart';

class ClientAccountView extends StackedView<ClientAccountViewModel> {
   ClientAccountView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(ClientAccountViewModel viewModel) {
    // TODO: implement onViewModelReady
    viewModel.hiveDBService.getLedgers();
    viewModel.notifyListeners();
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
                Row(
                  children: [
                    Container(
                        height: 40,
                        width: 150,
                        padding: EdgeInsets.all(9),
                        margin: EdgeInsets.only(right: 40),
                        decoration: BoxDecoration(
                            //color: kcPrimaryColor,
                          border: Border.all(color: kcLightGrey),
                            borderRadius: BorderRadius.all(Radius.circular(80))),

                        child: TextField(
                          controller: viewModel.searchController,
                          onChanged: (value){
                            viewModel.searchUser(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              hintText: "Search here",
                              suffixIcon: Icon(Icons.search)
                          ),
                        )
                    ),
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
                    //DropdownMenuExample(viewModel: viewModel,)
                    Text("${viewModel.filterString}"),
                    PopupMenuButton<int>(
                      tooltip: "Sort By",
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      initialValue: 0,
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<int>>[
                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(
                              'None',
                            ),
                            onTap: () {
                              viewModel.changeFilterText("Filter");
                              print("sorted Latest Products");
                             // viewModel.LatestSort();
                             // viewModel.notifyListeners();
                             /* model.refreshData();
                              model.getProductsdata(
                                  model.sorting, model.filter);*/
                            },
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(
                              'Latest First',
                            ),
                            onTap: () {
                              viewModel.changeFilterText("Latest First");
                              print("sorted Latest Products");
                              viewModel.LatestSort();
                              viewModel.notifyListeners();
                             /* model.refreshData();
                              model.getProductsdata(
                                  model.sorting, model.filter);*/
                            },
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(
                              'Oldest First',
                             // style: mediumSmallTextStyle,
                            ),
                            onTap: () {
                              viewModel.changeFilterText("Oldest First");
                              print("sorted Price Low to High");
                              // Body of value1
                            },
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(
                              'A-Z sort',
                            //  style: mediumSmallTextStyle,
                            ),
                            onTap: () {
                              viewModel.AtoZSort();
                              viewModel.changeFilterText("A-Z sort");
                              viewModel.notifyListeners();
                            },
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(
                              'Z-A sort',
                             // style: mediumSmallTextStyle,
                            ),
                            onTap: () {
                              viewModel.changeFilterText("Z-A sort");
                              viewModel.ZtoASort();
                              viewModel.notifyListeners();
                              print("sorted Popularity");
                              // Body of value1

                            },
                          ),

                        ];
                      },
                    ),

                  ],
                )
              ],
            ),
            verticalSpaceMedium,
            IntrinsicGridView.vertical(
                verticalSpace: 6,
                columnCount: 4,
                horizontalSpace: 3,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                children:
                    List.generate(viewModel.searchlistOfLedgers.length, (index) {
                  return Container(
                    width: 100,
                    //height: 50,
                    child: InkWell(
                      onTap: (){
                        viewModel.navService.navigateToAddUpdateLegdersView(ledgersData: viewModel.searchlistOfLedgers[index]);
                      },
                      child: Card(
                        color: kcLightGrey,
                        child: ListTile(
                          title: Text(viewModel.searchlistOfLedgers[index].name),
                          subtitle:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Text("Amount: ${viewModel.listOfLedgers[index].amount.toString()}£"),
                                  Text(viewModel.searchlistOfLedgers[index].description),
                                  Text(viewModel.searchlistOfLedgers[index].dateTime),

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

class DropdownMenuExample extends StatefulWidget {
  ClientAccountViewModel viewModel;
  DropdownMenuExample({super.key,required this.viewModel});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = filterList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      trailingIcon: Icon(Icons.filter_alt_sharp),
      //initialSelection: list.first,
      hintText: 'Apply Filter',
      enableSearch: false,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: filterList.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
