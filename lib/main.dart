// ignore_for_file: depend_on_referenced_packages

import 'package:fitzapp/Components/ApiKeys/api_keys.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_cubit.dart';
import 'package:fitzapp/Features/Authentication/SignUp/sign_up_cubit.dart';
import 'package:fitzapp/Features/Authentication/Verification/verification_cubit.dart';
import 'package:fitzapp/Features/Language/language_cubit.dart';
import 'package:fitzapp/Features/Language/language_states.dart';
import 'package:fitzapp/Presentation/Splash%20Screen/splash_screen.dart';
import 'package:fitzapp/firebase_options.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = StripeApiKeys.publishableKey;
  Future.wait([
    ScreenUtil.ensureScreenSize(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    )
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => VerificationCubit()),
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(
            create: (context) =>
                LanguageCubit()..getLanguageFromSharedPreference()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 813),
        ensureScreenSize: true,
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);

          return MediaQuery(
            data: data.copyWith(textScaleFactor: 1.0),
            child: BlocBuilder<LanguageCubit, InitialLanguageStates>(
                builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(),
                locale: LanguageCubit.get(context).english == true
                    ? const Locale('en')
                    : const Locale('ar'),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                title: FitzConstants.applicationName,
                debugShowCheckedModeBanner: false,
                home: const SplashScreen(),
              );
            }),
          );
        },
      ),
    );
  }
}
