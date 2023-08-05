import 'package:bank__sha/blocs/auth/auth_bloc.dart';
import 'package:bank__sha/blocs/user/user_bloc.dart';
import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/pages/data_package_page.dart';
import 'package:bank__sha/ui/pages/data_provider_page.dart';
import 'package:bank__sha/ui/pages/data_success.dart';
import 'package:bank__sha/ui/pages/home_page.dart';
import 'package:bank__sha/ui/pages/onboarding_page.dart';
import 'package:bank__sha/ui/pages/pin_page.dart';
import 'package:bank__sha/ui/pages/profile_edit_page.dart';
import 'package:bank__sha/ui/pages/profile_edit_pin_page.dart';
import 'package:bank__sha/ui/pages/profile_edit_success_page.dart';
import 'package:bank__sha/ui/pages/profile_page.dart';
import 'package:bank__sha/ui/pages/sign_in_page.dart';
import 'package:bank__sha/ui/pages/sign_up_page.dart';
import 'package:bank__sha/ui/pages/sign_up_success_page.dart';
import 'package:bank__sha/ui/pages/splash_page.dart';
// import 'package:bank__sha/ui/pages/topup_amount_page.dart';
import 'package:bank__sha/ui/pages/topup_page.dart';
import 'package:bank__sha/ui/pages/topup_success.dart';
import 'package:bank__sha/ui/pages/transfer_amount_page.dart';
import 'package:bank__sha/ui/pages/transfer_page.dart';
import 'package:bank__sha/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semibold,
            ),
            iconTheme: IconThemeData(
              color: blackColor,
            ),
          ),
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          // '/sign-up-set-profile': (context) => const SignUpSetProfilePage(),
          // '/sign-up-set-ktp': (context) => const SignUpSetKtpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/pin': (context) => const PinPage(),
          '/topup': (context) => const TopupPage(),
          // '/topup-amoount': (context) => const TopupAmountPage(),
          '/topup-success': (context) => const TopupSuccess(),
          '/transfer': (context) => const TransferPage(),
          // '/transfer-amount': (context) => const TransferAmountPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data': (context) => const DataProviderPage(),
          '/data-package': (context) => const DataPackagePage(),
          '/data-success': (context) => const DataSuccess(),
        },
      ),
    );
  }
}
