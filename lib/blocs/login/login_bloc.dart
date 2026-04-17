import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/Model/userModel/user_model.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/repository/auth_repository/loginRepository.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginrepository;
  final FirebaseRepository _firebaseRepository;
  LoginBloc(this._loginrepository,this._firebaseRepository) : super(LoginState()) {

    on<OnChangedEmailEvent>(_onEmailChanged);
    on<OnChangedPasswordEvent>(_onPasswordChanged);
    on<OnPasswordVisiblityEvent>(_isPasswordVisible);
    on<OnFormSubmitEvent>(_onFormSubmit);
    on<OnGoogleSignInEvent>(_ongoogleSignIn);

  }

   
  void _onEmailChanged(OnChangedEmailEvent event,Emitter<LoginState> emit)
  {
       emit(state.copyWith(newemail: event.email));
  }


  void _onPasswordChanged(OnChangedPasswordEvent event,Emitter<LoginState> emit)
  {
       emit(state.copyWith(newpassword: event.password));
  }

  void _isPasswordVisible(OnPasswordVisiblityEvent event,Emitter<LoginState> emit)
  {
      emit(state.copyWith(newIsObscurePassword: !state.isObscurePassword));
  }
 
  void _onFormSubmit(OnFormSubmitEvent event,Emitter<LoginState> emit) async{

      emit(state.copyWith(newLoginStatus: LoginStatus.loading));
    
      await _loginrepository.firebaseLogin(email: state.email, password: state.password).then((value){

           emit(state.copyWith(newLoginStatus: LoginStatus.success));
           
      }).onError((error, stackTrace) {

        emit(state.copyWith(newLoginStatus: LoginStatus.error,newError: error.toString()));

      });    
  }


  void _ongoogleSignIn(OnGoogleSignInEvent event, Emitter<LoginState> emit) async {

    emit(state.copyWith(newGoogleLoginStatus: GoogleLoginStatus.loading));

    await _loginrepository.loginWithGoogle().then((userCredential) async{

      if(userCredential.user==null) throw GeneralException('User not found.');  
      User user = userCredential.user!;
      
      UserModel userModel = UserModel(
        email:  state.email,
        token: user.uid,
        profileUrl: user.photoURL,
        userName: user.displayName,
        );
          await  _firebaseRepository.setData(collectionPath: 'Users',docpath: user.uid,data: userModel.toJson());
          emit(state.copyWith(newGoogleLoginStatus: GoogleLoginStatus.success));

        }).onError((error, stackTrace) {

          emit(state.copyWith( newGoogleLoginStatus: GoogleLoginStatus.error,newError: error.toString()));

        });
  }
  
}
