import 'package:app1/config/di/di.dart';
import 'package:flutter/material.dart';

import 'app1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
