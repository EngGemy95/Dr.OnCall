import 'package:device_preview/device_preview.dart';
import 'package:dr_on_call/utils/di.dart' as di;
import 'package:dr_on_call/presentation/state_management/bloc/current_home/current_home_bloc.dart';
import 'package:dr_on_call/presentation/state_management/bloc/switch_dark_mode/switch_dark_mode_bloc.dart';
import 'package:dr_on_call/presentation/resource_data/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'config/route_manager.dart';
import 'config/theme_manager.dart';
import 'presentation/state_management/bloc/change_password/change_password_bloc.dart';

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
        BlocProvider(
          create: (context) => di.instance<CurrentHomeBloc>(),
        ),
        BlocProvider(
          create: (_) => di.instance<ChangePasswordBloc>(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => RouteGenerator.getRoute(settings),
          theme: getApplicationTheme(),
        );
      }),
    );
  }
}
