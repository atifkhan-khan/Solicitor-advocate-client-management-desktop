import 'package:flutter_desktop_app_advocate/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:flutter_desktop_app_advocate/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:flutter_desktop_app_advocate/ui/views/home/home_view.dart';
import 'package:flutter_desktop_app_advocate/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_desktop_app_advocate/ui/views/client_account/client_account_view.dart';
import 'package:flutter_desktop_app_advocate/ui/views/ledger_form/ledger_form_view.dart';
import 'package:flutter_desktop_app_advocate/services/hive_d_b_service.dart';
import 'package:flutter_desktop_app_advocate/ui/views/add_update_legders/add_update_legders_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ClientAccountView),
    MaterialRoute(page: LedgerFormView),
    MaterialRoute(page: AddUpdateLegdersView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HiveDBService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
