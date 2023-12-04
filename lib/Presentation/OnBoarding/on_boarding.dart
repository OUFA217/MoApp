import 'package:fitzapp/Components/Buttons/primary_button.dart';
import 'package:fitzapp/Components/Dots/custom_dots.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Presentation/SignIn/sign_in.dart';
import 'package:fitzapp/Presentation/SignUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Padding(
                  padding: index == 0
                      ? EdgeInsets.only(left: 3.0.w)
                      : EdgeInsets.only(right: 1.0.w),
                  child: Container(
                      width: 370.w,
                      height: 550.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.topCenter,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  FitzConstants.onBoardingImages[index]))),
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        )),
                      )),
                ),
                Positioned(
                    child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 490.0.h, right: 1.w),
                    child: Text(
                      FitzConstants.onBoardingTitle[index],
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    constraints:
                        const BoxConstraints(maxHeight: 134.4, maxWidth: 308),
                    child: Text(
                      FitzConstants.onBoardingDescription[index],
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.15.h,
                  ),
                  OnBoardingDots(
                    currentIndex: currentIndex,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  PrimaryButton(
                    width: 343,
                    title: FitzConstants.buttonOnBoardingTitles[index],
                    ontap: () {
                      push(context, const SignUp());
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FitzConstants.haveAnAccount,
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      InkWell(
                        onTap: () {
                          push(context, SignIn());
                        },
                        child: Text(
                          FitzConstants.signIn,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ])),
              ],
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
