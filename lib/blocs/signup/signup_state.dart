part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final SignUpStatus signUpStatus;
  final bool isObscurePassword;
  final bool isObscureConfirmPassword;
  final String error;

  const SignupState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.signUpStatus = SignUpStatus.initail,
    this.isObscurePassword=true,
    this.isObscureConfirmPassword=true,
    this.error = '',
  });

  SignupState copyWith({
    String? newemail,
    String? newpassword,
    String? newconfirmPassword,
    SignUpStatus? newSignUpStatus,
    bool? newIsObscurePassword,
    bool? newIsObscureConfirmPassword,
    String? newError,
  }) {
    return SignupState(
      email: newemail ?? email,
      password: newpassword ?? password,
      confirmPassword: newconfirmPassword ?? confirmPassword,
      signUpStatus: newSignUpStatus ?? signUpStatus,
      isObscurePassword: newIsObscurePassword ?? isObscurePassword,
      isObscureConfirmPassword: newIsObscureConfirmPassword ?? isObscureConfirmPassword,
      error: newError ?? error
    );
  }

  @override
  List<Object?> get props => [email, password, confirmPassword,signUpStatus,error,isObscurePassword,isObscureConfirmPassword];
}
