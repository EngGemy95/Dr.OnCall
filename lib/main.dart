import 'package:blood_donation/app/my_app.dart';
import 'package:flutter/material.dart';
import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule(); // this function for call dependency injection
  runApp(MyApp());
}
