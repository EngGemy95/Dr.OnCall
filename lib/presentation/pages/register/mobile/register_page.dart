import 'package:dr_on_call/app/di.dart' as di;
import 'package:dr_on_call/presentation/state_management/bloc/password/password_visibility_bloc.dart';
import 'package:dr_on_call/presentation/state_management/bloc/register/register_bloc.dart';
import 'package:dr_on_call/presentation/pages/register/mobile/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.instance<PasswordVisibilityBloc>()),
        BlocProvider(create: (_) => di.instance<RegisterBloc>()),
      ],
      child: const AppSingUp(),
    );
  }
}
