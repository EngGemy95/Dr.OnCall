import 'package:Dr_OnCall/app/di.dart' as di;
import 'package:Dr_OnCall/presentation/bloc/Login/login_bloc.dart';
import 'package:Dr_OnCall/presentation/bloc/password/password_visibility_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../presentation/resource_data/route_manager.dart';
import '../presentation/resource_data/theme_manager.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  //Named Constructor
  MyApp.internal();

  static final MyApp _instance = MyApp.internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.instance<SignInBloc>()),
          BlocProvider(create: (_) => di.instance<PasswordVisibilityBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => RouteGenerator.getRoute(settings),
          theme: getApplicationTheme(),
        ),
      );
    });
  }
}
