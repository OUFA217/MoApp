import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_cubit.dart';
import 'package:fitzapp/Features/Authentication/Verification/verification_states.dart';
import 'package:fitzapp/Presentation/Age/age_screen.dart';
import 'package:fitzapp/Presentation/SignUp/sign_up.dart';
import 'package:fitzapp/Presentation/Verification/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationCubit extends Cubit<InitialVerificationState> {
  VerificationCubit() : super(SuperVerificationState());
  static VerificationCubit get(context) => BlocProvider.of(context);
  final pinPutController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String wrongOtpMessage = "This OTP isn't correct";
  Future<void> reSendOtp(
    String countryCode,
    String phoneNumber,
    context,
  ) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: countryCode + phoneNumber,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
          verificationFailed: (FirebaseAuthException error) {},
          codeSent: (String verificationId, int? resendCode) {
            SignUp.verify = verificationId;
            SignUp.resendCode = resendCode;
          },
          forceResendingToken: SignUp.resendCode,
          timeout: const Duration(seconds: 25),
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = SignUp.verify;
          });
    } on FirebaseAuthException catch (error) {
      emit(VerificationFailed(errpr: error.toString()));
    }
  }

  Future<void> verification(
      String countryCode,
      String phoneNumber,
      context,
      String userEmail,
      String userPassword,
      String firstName,
      String lastName) async {
    try {
      await FirebaseAuth.instance
          .verifyPhoneNumber(
              phoneNumber: countryCode + phoneNumber,
              verificationCompleted:
                  (PhoneAuthCredential phoneAuthCredential) {},
              verificationFailed: (FirebaseAuthException error) {},
              codeSent: (String verificationId, int? resendCode) {
                SignUp.verify = verificationId;
                SignUp.resendCode = resendCode;
              },
              forceResendingToken: SignUp.resendCode,
              timeout: const Duration(seconds: 25),
              codeAutoRetrievalTimeout: (String verificationId) {
                verificationId = SignUp.verify;
              })
          .then((value) {
        pushAndRemoved(
            context,
            Verification(
              userEmail: userEmail,
              userPassword: userPassword,
              countryCode: countryCode,
              firstName: firstName,
              lastName: lastName,
              phoneNumber: phoneNumber,
            ));
        SignInCubit.get(context).changeButtonState();
        emit(VerificationSuccessfull());
      });
    } on FirebaseAuthException catch (error) {
      emit(VerificationFailed(errpr: error.toString()));
    }
  }

  Future<void> checkOtp(
    context,
    String smsCode,
    String userEmail,
    String userPassword,
    String countryCode,
    String firstName,
    String lastName,
    String phoneNumber,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: SignUp.verify, smsCode: smsCode);
      await auth.signInWithCredential(credential);

      pushAndRemoved(
          context,
          AgeScreen(
            userEmail: userEmail,
            password: userPassword,
            countryCode: countryCode,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            userId: FirebaseAuth.instance.currentUser!.uid.toString(),
          ));
      emit(CheckOtpSuccessfull());
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          wrongOtpMessage,
          style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }
}
