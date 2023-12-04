// ignore_for_file: use_build_context_synchronously

import 'package:fitzapp/Components/Buttons/primary_button.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_cubit.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_states.dart';
import 'package:fitzapp/Presentation/SignUp/sign_up.dart';
import 'package:fitzapp/Presentation/Splash%20Screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, InitialSignInState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(13, 15, 19, 1),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 101.0.h, left: 16, right: 16),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      height: 67.h,
                      width: 111.w,
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          backgroundBlendMode: BlendMode.exclusion,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage(FitzConstants.applicationImage))),
                    ),
                    SizedBox(height: 24.h),
                    Text(FitzConstants.signIn,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 32.sp,
                            color: Colors.white)),
                    SizedBox(height: 43.h),
                    TextFormField(
                      style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                      controller: SignInCubit.get(context).emailController,
                      validator: (value) =>
                          value!.isEmpty ? FitzConstants.validatorEmail : null,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.r))),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r)),
                            gapPadding: 10.w,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.r))),
                          labelText: FitzConstants.hintEmailSignIn,
                          labelStyle: GoogleFonts.inter(
                              color: Colors.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                      controller: SignInCubit.get(context).passwordController,
                      validator: (value) => value!.isEmpty
                          ? FitzConstants.validatorPassword
                          : null,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.r))),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r)),
                            gapPadding: 10.w,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.r))),
                          labelText: FitzConstants.hintPassword,
                          labelStyle: GoogleFonts.inter(
                              color: Colors.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(height: 32.h),
                    PrimaryButton(
                      title: FitzConstants.signIn,
                      ontap: () async {
                        try {
                          var signIn = await SignInCubit.get(context)
                              .checkUserExist(context,
                                  email: SignInCubit.get(context)
                                      .emailController
                                      .text,
                                  password: SignInCubit.get(context)
                                      .passwordController
                                      .text);

                          if (signIn == true) {
                            SignInCubit.get(context).changeButtonState();
                            pushAndRemoved(context, const SplashScreen());
                          }
                        } catch (e) {}
                      },
                    ),
                    // SizedBox(height: 24.h),
                    // Text(
                    //   FitzConstants.forgotPassword,
                    //   style: GoogleFonts.inter(
                    //       color: Colors.white,
                    //       fontSize: 14.sp,
                    //       fontWeight: FontWeight.w400),
                    // ),

                    SizedBox(height: 97.79.h),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        FitzConstants.dontHaveAnAccount,
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
                          push(context, const SignUp());
                        },
                        child: Text(
                          FitzConstants.signUp,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
