import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Authentication/SignUp/sign_up_cubit.dart';
import 'package:fitzapp/Features/Authentication/Verification/verification_cubit.dart';
import 'package:fitzapp/Features/Authentication/Verification/verification_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatelessWidget {
  const Verification(
      {super.key,
      required this.userEmail,
      required this.userPassword,
      required this.countryCode,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber});
  final String userEmail;
  final String userPassword;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, InitialVerificationState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(13, 15, 19, 1),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 140.0.h, left: 16.w, right: 16.w),
              child: Column(
                children: [
                  Text(FitzConstants.phoneVerification,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 28.sp,
                          color: Colors.white)),
                  SizedBox(height: 16.h),
                  Text(FitzConstants.sentCode,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.grey)),
                  SizedBox(height: 8.h),
                  SizedBox(height: 23.h),
                  Pinput(
                    controller: VerificationCubit.get(context).pinPutController,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    length: 6,
                    onCompleted: (value) {
                      VerificationCubit.get(context).checkOtp(
                          context,
                          VerificationCubit.get(context).pinPutController.text,
                          userEmail,
                          userPassword,
                          countryCode,
                          firstName,
                          lastName,
                          phoneNumber);
                    },
                    animationCurve: Curves.easeOut,
                    focusedPinTheme: PinTheme(
                        width: 62.55.w,
                        height: 62.55.w,
                        textStyle: GoogleFonts.poppins(
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.6.r)))),
                    defaultPinTheme: PinTheme(
                        width: 62.55.w,
                        height: 62.55.w,
                        textStyle: GoogleFonts.poppins(
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.6.r)))),
                  ),
                  SizedBox(height: 23.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FitzConstants.dontReceiveCode,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          VerificationCubit.get(context).reSendOtp(
                            SignUpCubit.get(context).countryCode,
                            SignUpCubit.get(context).phoneController.text,
                            context,
                          );
                        },
                        child: Text(
                          FitzConstants.resend,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
