import 'package:fitzapp/Features/Authentication/SignUp/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<InitialSignUpState> {
  SignUpCubit() : super(SuperSignUpState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String countryCode = "+20";

  void getCountryCode(String code) {
    countryCode = code;
    emit(ChangeCountryCodeSuccessfully());
  }
}
// karim ashraf was here :(