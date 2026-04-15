part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String error;
  final LoginStatus loginStatus;
  final GoogleLoginStatus googleLoginStatus;
  final bool isObscurePassword;

  const LoginState({
    this.email = '',
    this.password = '',
    this.error='',
    this.loginStatus = LoginStatus.initail,
    this.googleLoginStatus = GoogleLoginStatus.initail,
    this.isObscurePassword = true,
  });

  LoginState copyWith({
    String? newemail,
    String? newpassword,
    String? newError,
    LoginStatus? newLoginStatus,
    GoogleLoginStatus? newGoogleLoginStatus,
    bool? newIsObscurePassword
  }) {
    return LoginState(
      email: newemail ?? email,
      password: newpassword ?? password,
      error: newError ?? error,
      loginStatus: newLoginStatus ?? loginStatus,
      googleLoginStatus: newGoogleLoginStatus ?? googleLoginStatus,
      isObscurePassword: newIsObscurePassword ?? isObscurePassword,
    );
  }

  @override
  List<Object?> get props => [email, password, error, loginStatus, googleLoginStatus, isObscurePassword];
}
