import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_advocate/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'add_update_legders_viewmodel.dart';

class AddUpdateLegdersView extends StackedView<AddUpdateLegdersViewModel> {
  const AddUpdateLegdersView({Key? key}) : super(key: key);

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
                IconButton(onPressed: (){viewModel.navService.back();}, icon: Icon(Icons.close))
              ],
            ),
            Container(child: Text('Details'),),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                children: [
                  Text("Amount IN"),
                  Container(
                    width: screenWidth(context)/2.5,
                    height: screenHeight(context)/1.4,
                    color: Colors.blueGrey,
                    child: ListView.builder(
                      itemCount: 51,
                        itemBuilder: (context,index){
                          return Container(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Amount: 102",style: TextStyle(color: Colors.white),),
                                Text("Amount: ${viewModel.cdate}",style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          );
                        }
                    ),
                  ),

                ],
              ),
              horizontalSpaceSmall,
              Column(
                children: [
                  Text("Amount OUT"),
                  Container(
                    width: screenWidth(context)/2.5,
                    height: screenHeight(context)/1.4,
                    color: Colors.blueGrey,),
                ],
              ),
            ],)
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
