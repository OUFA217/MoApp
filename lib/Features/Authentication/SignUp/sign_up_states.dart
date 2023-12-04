import 'package:fitzapp/Features/Authentication/UserModel/UserModel.dart';

abstract class InitialSignUpState {}

class SuperSignUpState extends InitialSignUpState {}

class SignUpSuccessfull extends SuperSignUpState {
  final UserModel user;

  SignUpSuccessfull({required this.user});
}

class SignUpFailed extends SuperSignUpState {
  final String errpr;

  SignUpFailed({required this.errpr});
}

class ChangeCountryCodeSuccessfully extends SuperSignUpState {}
