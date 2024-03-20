import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_advocate/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_desktop_app_advocate/ui/common/app_colors.dart';
import 'package:flutter_desktop_app_advocate/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    const Text(
                      'ACCOUNTS',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color: kcPrimaryColor,
                      //onPressed: viewModel.navClientAccount(),
                      onPressed: () {
                        viewModel.navigationService
                            .navigateToClientAccountView();
                      },
                      child: Text(
                        'Client Account',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color: kcPrimaryColor,
                      onPressed: () {},
                      child: Text(
                        'Office Account',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

/*
MaterialButton(
color: Colors.black,
onPressed: viewModel.incrementCounter,
child: Text(
viewModel.counterLabel,
style: const TextStyle(color: Colors.white),
),
),*/

/*
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
MaterialButton(
color: kcDarkGreyColor,
onPressed: viewModel.showDialog,
child: const Text(
'Show Dialog',
style: TextStyle(
color: Colors.white,
),
),
),
MaterialButton(
color: kcDarkGreyColor,
onPressed: viewModel.showBottomSheet,
child: const Text(
'Show Bottom Sheet',
style: TextStyle(
color: Colors.white,
),
),
),
],
)*/
