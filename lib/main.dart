import 'package:Dr_OnCall/my_app.dart';
import 'package:flutter/material.dart';
import 'app/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initAppModule(); // this function for call dependency injection
  runApp(MyApp());
}
