import 'package:bank__sha/ui/pages/onboarding_page.dart';
import 'package:bank__sha/ui/pages/sign_in_page.dart';
import 'package:bank__sha/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
      },
    );
  }
}
