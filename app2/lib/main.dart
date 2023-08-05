import 'package:app2/config/di/di.dart';
import 'package:flutter/material.dart';

import 'app2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
