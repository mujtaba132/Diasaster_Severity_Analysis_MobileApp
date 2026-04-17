import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/Model/userModel/user_model.dart';
import 'package:fyp_project/blocs/signup/signup_event.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/repository/auth_repository/loginRepository.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/repository/auth_repository/signUpRepository.dart';
import 'package:fyp_project/utils/enums.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupRepository signupRepository;
  LoginRepository loginRepository;
  FirebaseRepository firebaseRepository;
  SignupBloc(
    this.loginRepository,
    this.signupRepository,
    this.firebaseRepository,
  ) : super(SignupState()) {
    on<OnChangedEmailEvent>(_onChangedEmail);
    on<OnChangedPasswordEvent>(_onChangedPassword);
    on<OnChangedConfirmPasswordEvent>(_onChangedConfirmPassword);
    on<OnPasswordVisiblityEvent>(_onPasswordVisible);
    on<OnConfirmPasswordVisiblityEvent>(_onConfirmPasswordVisible);
    on<OnFormSubmit>(_onFormSubmit);
  }

  void _onChangedEmail(OnChangedEmailEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(newemail: event.email));
  }

  void _onChangedPassword(
    OnChangedPasswordEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(newpassword: event.password));
  }

  void _onChangedConfirmPassword(
    OnChangedConfirmPasswordEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(newconfirmPassword: event.confirmPassword));
  }

  void _onPasswordVisible(
    OnPasswordVisiblityEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(newIsObscurePassword: !state.isObscurePassword));
  }

  void _onConfirmPasswordVisible(
    OnConfirmPasswordVisiblityEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        newIsObscureConfirmPassword: !state.isObscureConfirmPassword,
      ),
    );
  }


  void _onFormSubmit(OnFormSubmit event, Emitter<SignupState> emit) async {
    emit(state.copyWith(newSignUpStatus: SignUpStatus.loading));

    try {

      UserCredential? userCredential;
      userCredential = await signupRepository.createAccount(email: state.email,password: state.password);

      if(userCredential == null)  throw GeneralException('No Credentails created...');
       
       UserModel user = UserModel(
        email:  state.email,
        token: userCredential.user!.uid,
        userName:state.email.split('@')[0],
      );

       await  firebaseRepository.setData(collectionPath: 'Users',docpath: userCredential.user!.uid,data: user.toJson());
       emit(state.copyWith(newSignUpStatus: SignUpStatus.success));
       
    } catch (e) {
      emit(
        state.copyWith(newSignUpStatus: SignUpStatus.error, newError: e.toString()));
    }
  }
}
