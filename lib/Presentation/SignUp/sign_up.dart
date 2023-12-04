import 'package:fitzapp/Components/ApplicationIcon/application_icon.dart';
import 'package:fitzapp/Components/Buttons/primary_button.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Components/PrivacyPolicy/privacy_policy.dart';
import 'package:fitzapp/Components/TextField/custom_text_form_field.dart';
import 'package:fitzapp/Constants/constants.dart';
import 'package:fitzapp/Features/Authentication/SignUp/sign_up_cubit.dart';
import 'package:fitzapp/Features/Authentication/SignUp/sign_up_states.dart';
import 'package:fitzapp/Features/Authentication/Verification/verification_cubit.dart';
import 'package:fitzapp/Presentation/SignIn/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static String verify = "";
  static int? resendCode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocBuilder<SignUpCubit, InitialSignUpState>(
          builder: (context, state) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(13, 15, 19, 1),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 95.0.h, left: 16.w, right: 16.w),
                child: Form(
                    key: SignUpCubit.get(context).formkey,
                    child: Column(
                      children: [
                        const ApplicationIcon(),
                        Text(FitzConstants.signUp,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 32.sp,
                                color: Colors.white)),
                        SizedBox(height: 32.h),
                        CustomTextFormField(
                          valueEmpty: FitzConstants.validatorFirstName,
                          controller:
                              SignUpCubit.get(context).firstNameController,
                          labelText: FitzConstants.hintFirstName,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                          valueEmpty: FitzConstants.validatorLastName,
                          controller:
                              SignUpCubit.get(context).lastNameController,
                          labelText: FitzConstants.hintLastName,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                          valueEmpty: FitzConstants.validatorEmail,
                          controller: SignUpCubit.get(context).emailController,
                          labelText: FitzConstants.hintEmailSignUp,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                            valueEmpty: FitzConstants.validatorPhone,
                            controller:
                                SignUpCubit.get(context).phoneController,
                            labelText: FitzConstants.hintPhone,
                            textInputType: TextInputType.phone,
                            isPhoneNumber: true),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                          valueEmpty: FitzConstants.validatorPassword,
                          controller:
                              SignUpCubit.get(context).passwordController,
                          labelText: FitzConstants.hintPassword,
                          textInputType: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        const PrivacyPolicy(),
                        SizedBox(height: 16.h),
                        PrimaryButton(
                          title: FitzConstants.signUp,
                          ontap: () {
                            if (SignUpCubit.get(context)
                                .formkey
                                .currentState!
                                .validate()) {
                              VerificationCubit.get(context).verification(
                                  SignUpCubit.get(context).countryCode,
                                  SignUpCubit.get(context).phoneController.text,
                                  context,
                                  SignUpCubit.get(context).emailController.text,
                                  SignUpCubit.get(context)
                                      .passwordController
                                      .text,
                                  SignUpCubit.get(context)
                                      .firstNameController
                                      .text,
                                  SignUpCubit.get(context)
                                      .lastNameController
                                      .text);
                            }
                          },
                        ),
                        SizedBox(height: 75.h),
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
                            ]),
                        SizedBox(height: 25.h),
                      ],
                    )),
              ),
            ),
          ),
        );
      }),
    );
  }
}
