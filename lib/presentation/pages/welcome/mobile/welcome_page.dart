import 'package:dr_on_call/utils/responsive.dart';
import 'package:dr_on_call/presentation/pages/welcome/mobile/welcome.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      tablet: Material(child: Center(child: Text("Tablet"))),
      desktop: Material(child: Center(child: Text("Desktop"))),
      mobile: WelcomeMobileScreen(),
    );
  }
}
