import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Presentation/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen(
      {super.key,
      required this.userEmail,
      required this.password,
      required this.countryCode,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.age,
      required this.weight,
      required this.height,
      required this.userId});

  final userEmail;
  final password;
  final countryCode;
  final firstName;
  final lastName;
  final phoneNumber;
  final age;
  final weight;
  final height;
  final userId;

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  String currentIndex = FitzConstants.goals[0][0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 15, 19, 1),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: 90.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                FitzConstants.askForGoal,
                style: GoogleFonts.inter(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                FitzConstants.helpForPersonalPlan,
                style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(height: 75.h),
              SizedBox(
                height: 450.h,
                width: 300.0.w,
                child: ListWheelScrollView(
                  overAndUnderCenterOpacity: 0.8,
                  squeeze: 1,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      currentIndex = FitzConstants.goals[0][value];
                    });
                  },
                  itemExtent: 100,
                  diameterRatio: 10,
                  children:
                      List.generate(FitzConstants.goals[0].length, (index) {
                    if (currentIndex == FitzConstants.goals[0][index]) {
                      return Column(
                        children: [
                          Container(
                            width: 247.0.w,
                            height: 3.0.h,
                            color: const Color.fromRGBO(248, 168, 33, 1),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            FitzConstants.goals[0][index].toString(),
                            style: currentIndex == FitzConstants.goals[0][index]
                                ? GoogleFonts.poppins(
                                    fontSize: 28.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)
                                : GoogleFonts.inter(
                                    fontSize: 28.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 23.h),
                          Container(
                            width: 247.0.w,
                            height: 3.0.h,
                            color: const Color.fromRGBO(248, 168, 33, 1),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(height: 23.h),
                          Text(
                            FitzConstants.goals[0][index].toString(),
                            style: currentIndex == FitzConstants.goals[0][index]
                                ? GoogleFonts.poppins(
                                    fontSize: 48.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)
                                : GoogleFonts.inter(
                                    fontSize: 28.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                          ),
                        ],
                      );
                    }
                  }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0.w, top: 25.h),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.0.r),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(40, 42, 46, 1)),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 26.w),
                        child: InkWell(
                          onTap: () {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(widget.userEmail.toString())
                                .set({
                              "firstName": widget.firstName,
                              "lastName": widget.lastName,
                              "password": widget.password,
                              "email": widget.userEmail.toString(),
                              "phoneNumber":
                                  widget.countryCode + widget.phoneNumber,
                              "id": widget.userId.toString(),
                              "age": widget.age,
                              "height": widget.height,
                              "weight": widget.weight,
                              "goal": currentIndex.toString(),
                              "subscription": false,
                              "end_on": "",
                              "start_on": "",
                              "week_1": false,
                              "week_2": false,
                              "week_3": false,
                              "week_4": false,
                              "program_name": "",
                            }).then((value) async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString(
                                  'userId', widget.userId.toString());
                              prefs.setString(
                                  'email', widget.userEmail.toString());
                              Future.delayed(const Duration(milliseconds: 800))
                                  .then((value) {
                                push(context, const HomeScreen());
                              });
                            }).catchError((error) {});
                          },
                          child: Container(
                            width: 96.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(246, 168, 33, 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.r))),
                            child: Center(
                                child: Text(
                              FitzConstants.next,
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
