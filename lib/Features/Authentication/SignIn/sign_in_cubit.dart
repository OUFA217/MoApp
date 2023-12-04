import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitzapp/Components/Buttons/primary_button.dart';
import 'package:fitzapp/Components/Navigations/custom_navigate.dart';
import 'package:fitzapp/Features/Authentication/SignIn/sign_in_states.dart';
import 'package:fitzapp/Presentation/SignIn/sign_in.dart';
import 'package:fitzapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInCubit extends Cubit<InitialSignInState> {
  SignInCubit() : super(SuperSignInState());

  static SignInCubit get(context) => BlocProvider.of(context);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> checkUserExist(context,
      {String? email, String? password}) async {
    try {
      PrimaryButton.isClicked = true;
      emit(ChangeButtonState());
      final DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').doc(email).get();
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

      if (data['email'] == email && data['password'] == password) {
        FirebaseAuth.instance.signInWithPhoneNumber(data['phoneNumber']);
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("email", data['email']);
        var emailCheck = sharedPreferences.get("email");
        Logger().e(emailCheck);
        return true;
      } else if (data['email'] == email && data['password'] != password) {
        PrimaryButton.isClicked = false;

        emit(ChangeButtonState());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 750),
          backgroundColor: Colors.red,
          content: Text(S.of(context).validPassword,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600)),
        ));

        return false;
      } else {
        PrimaryButton.isClicked = false;
        emit(ChangeButtonState());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 750),
          backgroundColor: Colors.red,
          content: Text(S.of(context).validCredential,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600)),
        ));
        return false;
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 750),
        backgroundColor: Colors.red,
        content: Text(S.of(context).validCredential,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600)),
      ));
      PrimaryButton.isClicked = false;
      emit(ChangeButtonState());
      return false;
    }
  }

  String? email;
  Future<DocumentSnapshot> getEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email");
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    try {
      return snapshot;
    } catch (error) {
      Logger().e(error);
      return snapshot;
    }
  }

  Future<void> signOut(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    FirebaseAuth.instance.signOut();
    emailController.clear();
    passwordController.clear();
    pushAndRemoved(context, SignIn());
  }

  changeButtonState() {
    PrimaryButton.isClicked = false;
    emit(ChangeButtonState());
  }
}
