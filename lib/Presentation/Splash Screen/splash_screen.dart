import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Presentation/Home/home_screen.dart';
import 'package:fitzapp/Presentation/OnBoarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init(context) {
    Future.delayed(const Duration(milliseconds: 1500)).then((value) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? email;
      email = sharedPreferences.getString("email");
      Logger().e(email);
      //  Get Current User
      if (email == null) {
        navigateToOnBoarding1(context, const OnBoarding());
      } else {
        final DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .get();
        Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
        // Date handling to check if the date is validated
        if (data['end_on'] == "") {
          navigateToOnBoarding1(context, const HomeScreen());
        }
        Logger().e(data['end_on']);
        Logger().e(data['end_on'].toString().trim());

        DateTime formattedEndOnDate =
            DateFormat("yyyy-MM-dd", "en").parse(data['end_on']);
        Logger().e(formattedEndOnDate);

        String formattedNowDate =
            DateFormat('yyyy-MM-dd', "en").format(DateTime.now());
        final DateTime now = DateTime.parse(formattedNowDate);

        if (now.isAfter(formattedEndOnDate) ||
            now.isAtSameMomentAs(formattedEndOnDate)) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({
            "subscription": false,
            "end_on": "",
            "start_on": "",
            "week_1": false,
            "week_2": false,
            "week_3": false,
            "week_4": false,
            "program_name": "",
          }).then((value) {
            navigateToOnBoarding1(context, const HomeScreen());
          });
        } else {
          navigateToOnBoarding1(context, const HomeScreen());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(13, 15, 19, 1),
        body: Center(
          child: SizedBox(
            height: 175.h,
            width: 200.w,
            child: const Image(
              image: AssetImage(FitzConstants.applicationImage),
              filterQuality: FilterQuality.none,
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
