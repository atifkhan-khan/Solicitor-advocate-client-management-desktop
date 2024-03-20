import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/hive_d_b_service.dart';

class AddUpdateLegdersViewModel extends BaseViewModel {
  final hiveDBService = locator<HiveDBService>();
  final navService = locator<NavigationService>();

  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

}
