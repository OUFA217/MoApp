import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Presentation/Weight/weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AgeScreen extends StatefulWidget {
  const AgeScreen({
    super.key,
    required this.userEmail,
    required this.password,
    required this.countryCode,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userId,
  });

  final userEmail;
  final password;
  final countryCode;
  final firstName;
  final lastName;
  final phoneNumber;
  final userId;

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int currentIndex = FitzConstants.ages[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: SizedBox(
        height: 812.sh,
        width: 375.sw,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 90.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  FitzConstants.askForAge,
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
                    onSelectedItemChanged: (value) {
                      setState(() {
                        currentIndex = FitzConstants.ages[value];
                      });
                    },
                    itemExtent: 100,
                    diameterRatio: 10,
                    children: List.generate(FitzConstants.ages.length, (index) {
                      if (FitzConstants.ages[index] == currentIndex) {
                        return Column(
                          children: [
                            Container(
                              width: 113.0.w,
                              height: 3.0.h,
                              color: const Color.fromRGBO(248, 168, 33, 1),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              FitzConstants.ages[index].toString(),
                              style: FitzConstants.ages[index] == currentIndex
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
                              FitzConstants.ages[index].toString(),
                              style: FitzConstants.ages[index] == currentIndex
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
                        Container(
                          padding: EdgeInsets.all(15.0.r),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(28, 29, 30, 1)),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 26.w),
                          child: InkWell(
                            onTap: () {
                              push(
                                  context,
                                  WeightScreen(
                                      userEmail: widget.userEmail,
                                      password: widget.password,
                                      countryCode: widget.countryCode,
                                      firstName: widget.firstName,
                                      lastName: widget.lastName,
                                      phoneNumber: widget.phoneNumber,
                                      age: currentIndex,
                                      userId: widget.userId));
                            },
                            child: Container(
                              width: 96.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(246, 168, 33, 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.r))),
                              child: Center(
                                  child: Text(
                                FitzConstants.next,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
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
      ),
    );
  }
}
