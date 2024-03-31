import 'package:dr_on_call/utils/di.dart';
import 'package:dr_on_call/utils/responsive.dart';
import 'package:dr_on_call/presentation/state_management/bloc/gender/gender_bloc.dart';
import 'package:dr_on_call/presentation/pages/profile/mobile/profile_mobile_screen.dart';
import 'package:dr_on_call/presentation/state_management/cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileMobilePage extends StatelessWidget {
  const ProfileMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => instance<GenderBloc>(),
        ),
        BlocProvider(
          create: (context) => instance<ImageCubit>(),
        ),
      ],
      child: Responsive(
        mobile: ProfileMobileScreen(),
        tablet: const Scaffold(body: Center(child: Text("Tablet"))),
        desktop: const Scaffold(body: Center(child: Text("Desktop"))),
      ),
    );
  }
}
