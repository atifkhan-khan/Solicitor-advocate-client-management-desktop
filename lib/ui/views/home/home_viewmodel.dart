import 'package:flutter_desktop_app_advocate/app/app.bottomsheets.dart';
import 'package:flutter_desktop_app_advocate/app/app.dialogs.dart';
import 'package:flutter_desktop_app_advocate/app/app.locator.dart';
import 'package:flutter_desktop_app_advocate/app/app.router.dart';
import 'package:flutter_desktop_app_advocate/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
}
