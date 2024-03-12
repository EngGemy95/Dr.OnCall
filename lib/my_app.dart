import 'package:Dr/app/di.dart' as di;
import 'package:Dr/presentation/bloc/Login/login_bloc.dart';
import 'package:Dr/presentation/bloc/password/password_visibility_bloc.dart';
import 'package:Dr/presentation/bloc/switch_dark_mode/switch_dark_mode_bloc.dart';
import 'package:Dr/presentation/resource_data/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../presentation/resource_data/route_manager.dart';
import '../presentation/resource_data/theme_manager.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  //Named Constructor
  const MyApp.internal({super.key});

  static const MyApp _instance = MyApp.internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorManager.primary));

    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: [
    //     // SystemUiOverlay.top,
    //     // SystemUiOverlay.bottom,
    //   ],
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.instance<SwitchModeBloc>(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => RouteGenerator.getRoute(settings),
          theme: getApplicationTheme(),
        );
      }),
    );
  }
}
