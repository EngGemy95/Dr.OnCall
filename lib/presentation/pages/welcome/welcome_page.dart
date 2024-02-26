import 'package:Dr/app/responsive.dart';
import 'package:Dr/presentation/components/Welcome.dart';
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
