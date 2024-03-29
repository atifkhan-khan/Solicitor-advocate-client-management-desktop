import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_advocate/app/app.bottomsheets.dart';
import 'package:flutter_desktop_app_advocate/app/app.dialogs.dart';
import 'package:flutter_desktop_app_advocate/app/app.locator.dart';
import 'package:flutter_desktop_app_advocate/app/app.router.dart';
import 'package:flutter_desktop_app_advocate/data/ledgersData/userLedgerDataModel.dart';
import 'package:flutter_desktop_app_advocate/data/officeAccountLedger/officeLedger.dart';
import 'package:flutter_desktop_app_advocate/data/userForm/ledgersDataModel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

    WindowManager.instance.setMinimumSize(const Size(1200, 600));
    WindowManager.instance.setMaximumSize(const Size(1600, 1000));

  var dir = await path.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.initFlutter('advocateDB');
  Hive.registerAdapter(LedgersDataAdapter());
  Hive.registerAdapter(UserLedgersDataModelAdapter());
  Hive.registerAdapter(OfficeLedgersDataModelAdapter());
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
