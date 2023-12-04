import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Presentation/Goal/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen(
      {super.key,
      required this.userEmail,
      required this.password,
      required this.countryCode,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.age,
      required this.weight,
      required this.userId});

  final userEmail;
  final password;
  final countryCode;
  final firstName;
  final lastName;
  final phoneNumber;
  final age;
  final weight;
  final userId;

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int currentIndex = FitzConstants.height[0];

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
                FitzConstants.askForHeight,
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
                width: 113.0.w,
                child: ListWheelScrollView(
                  overAndUnderCenterOpacity: 0.8,
                  squeeze: 1,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      currentIndex = FitzConstants.height[value];
                    });
                  },
                  itemExtent: 100,
                  diameterRatio: 10,
                  children: List.generate(FitzConstants.height.length, (index) {
                    if (FitzConstants.height[index] == currentIndex) {
                      return Column(
                        children: [
                          Container(
                            width: 113.0.w,
                            height: 3.0.h,
                            color: const Color.fromRGBO(248, 168, 33, 1),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            FitzConstants.height[index].toString(),
                            style: FitzConstants.height[index] == currentIndex
                                ? GoogleFonts.poppins(
                                    fontSize: 48.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)
                                : GoogleFonts.inter(
                                    fontSize: 28.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            width: 113.0.w,
                            height: 3.0.h,
                            color: const Color.fromRGBO(248, 168, 33, 1),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            FitzConstants.height[index].toString(),
                            style: FitzConstants.height[index] == currentIndex
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
                            push(
                                context,
                                GoalScreen(
                                    userEmail: widget.userEmail,
                                    password: widget.password,
                                    countryCode: widget.countryCode,
                                    firstName: widget.firstName,
                                    lastName: widget.lastName,
                                    phoneNumber: widget.phoneNumber,
                                    age: widget.age,
                                    weight: widget.weight,
                                    height: currentIndex,
                                    userId: widget.userId));
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
