import 'package:flutter/material.dart';

import 'app/app.dart';
import 'common/constants/cash_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  runApp(const App());
}
