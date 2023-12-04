import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Presentation/Height/height_screen.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen(
      {super.key,
      required this.userEmail,
      required this.password,
      required this.countryCode,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.age,
      required this.userId});
  final userEmail;
  final password;
  final countryCode;
  final firstName;
  final lastName;
  final phoneNumber;
  final age;
  final userId;

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double initWeight = 70.0;

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
                FitzConstants.askForWeight,
                style: GoogleFonts.inter(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                S.of(context).canChangeLater,
                style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(height: 168.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    initWeight.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 64.0.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0.h),
                    child: Text(
                      S.of(context).kg,
                      style: GoogleFonts.inter(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              VerticalWeightSlider(
                diameterRatio: 10,
                decoration: PointerDecoration(
                  width: 130.0.w,
                  height: 3.0.h,
                  largeColor: Colors.amber,
                  mediumColor: Colors.amber,
                  smallColor: Colors.amber,
                ),
                controller: WeightSliderController(
                  interval: 1,
                  initialWeight: initWeight,
                  itemExtent: 15,
                  minWeight: 30,
                ),
                onChanged: (value) {
                  setState(() {
                    initWeight = value;
                  });
                },
                isVertical: false,
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
                                HeightScreen(
                                  userEmail: widget.userEmail,
                                  password: widget.password,
                                  countryCode: widget.countryCode,
                                  firstName: widget.firstName,
                                  lastName: widget.lastName,
                                  phoneNumber: widget.phoneNumber,
                                  age: widget.age,
                                  weight: initWeight,
                                  userId: widget.userId,
                                ));
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
                                  fontWeight: FontWeight.w400, fontSize: 16.sp),
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
