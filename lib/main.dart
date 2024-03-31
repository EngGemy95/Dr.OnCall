import 'package:device_preview/device_preview.dart';
import 'package:dr_on_call/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'utils/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initAppModule(); // this function for call dependency injection
  runApp(
    DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
  );
}
