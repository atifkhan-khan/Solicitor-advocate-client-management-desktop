import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_desktop_app_advocate/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LedgerFormViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
