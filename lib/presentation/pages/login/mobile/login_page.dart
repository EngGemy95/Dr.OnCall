import 'package:Dr/presentation/pages/login/mobile/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart' as di;
import '../../../bloc/Login/login_bloc.dart';
import '../../../bloc/password/password_visibility_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => di.instance<SignInBloc>()),
      BlocProvider(create: (_) => di.instance<PasswordVisibilityBloc>()),
    ], child: AppSignIn());
  }
}
