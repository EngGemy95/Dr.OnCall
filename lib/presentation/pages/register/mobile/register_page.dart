import 'package:Dr/app/di.dart' as di;
import 'package:Dr/presentation/bloc/password/password_visibility_bloc.dart';
import 'package:Dr/presentation/bloc/register/register_bloc.dart';
import 'package:Dr/presentation/pages/register/mobile/register_screen.dart';
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
      child: AppSingUp(),
    );
  }
}
