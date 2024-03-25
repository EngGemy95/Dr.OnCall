import 'package:dr_on_call/presentation/pages/login/mobile/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart' as di; 
import '../../../state_management/bloc/login/login_bloc.dart';
import '../../../state_management/bloc/password/password_visibility_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => di.instance<SignInBloc>()),
      BlocProvider(create: (_) => di.instance<PasswordVisibilityBloc>()),
    ], child: const AppSignIn());
  }
}
