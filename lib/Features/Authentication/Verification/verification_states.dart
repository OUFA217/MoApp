abstract class InitialVerificationState {}

class SuperVerificationState extends InitialVerificationState {}

class VerificationSuccessfull extends SuperVerificationState {}

class VerificationFailed extends SuperVerificationState {
  final String errpr;

  VerificationFailed({required this.errpr});
}

class CheckOtpSuccessfull extends SuperVerificationState {}

class CheckOtpFailed extends SuperVerificationState {
  final String errpr;

  CheckOtpFailed({required this.errpr});
}
