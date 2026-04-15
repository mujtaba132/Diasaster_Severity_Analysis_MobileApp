import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Core/appkeys.dart';
import 'package:fyp_project/Core/apptheme.dart';
import 'package:fyp_project/Providers/BottomNavBar/BottomNavBar.dart';
import 'package:fyp_project/Providers/Citizen/DataUploadProvider.dart';
import 'package:fyp_project/blocs/camera/camera_bloc.dart';
import 'package:fyp_project/blocs/login/login_bloc.dart';
import 'package:fyp_project/blocs/register_ngo/register_ngo_bloc.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/blocs/signup/signup_bloc.dart';
import 'package:fyp_project/config/routes/routes.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/firebase_options.dart';
import 'package:fyp_project/repository/cloudinary_repository/cloudinaryRepository.dart';
import 'package:fyp_project/repository/auth_repository/forgetPasswordRepository.dart';
import 'package:fyp_project/repository/auth_repository/loginRepository.dart';
import 'package:fyp_project/repository/media_repository/submit_media_repository.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/repository/media_repository/pickMediaRepository.dart';
import 'package:fyp_project/repository/auth_repository/signUpRepository.dart';
import 'package:fyp_project/repository/media_repository/uploadMediaRepository.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final getit = GetIt.instance; 
List<CameraDescription> camera=[];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  serviceloader();
  runApp(MultiProvider(
    providers: [
          ChangeNotifierProvider(create: (_) => BottomNavProvider()),
          ChangeNotifierProvider(create: (_) => UploadProvider(),)
    ],
    child: MultiBlocProvider(
      providers: [
           BlocProvider(create: (context) => RequestNgoBloc(getit()))
      ],
      child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      scaffoldMessengerKey: AppKeys.scaffoldMessengerKey,
      onGenerateRoute: Routes.generateRoutes,
      initialRoute: RoutesName.splashScreen,
    );
  }
}


void serviceloader()
{
    getit.registerLazySingleton<SignupRepository>(()=> SignupRepository());
    getit.registerLazySingleton<LoginRepository>(()=> LoginRepository());
    getit.registerFactory<LoginBloc>(() => 
        LoginBloc(
          getit<LoginRepository>(),
          getit<FirebaseRepository>()));
    getit.registerLazySingleton<Forgetpasswordrepository>(() => Forgetpasswordrepository());
    getit.registerFactory<SignupBloc>(() => 
       SignupBloc( 
        getit<LoginRepository>(), 
        getit<SignupRepository>(),
        getit<FirebaseRepository>()));

    
    getit.registerLazySingleton<Cloudinaryrepository>(() => Cloudinaryrepository());
    getit.registerLazySingleton<FirebaseRepository>(() => FirebaseRepository());
    getit.registerFactory<RegisterNgoBloc>(() => 
       RegisterNgoBloc(
        getit<Cloudinaryrepository>(), 
        getit<FirebaseRepository>()));
        

    getit.registerLazySingleton<PickMediaRepository>(() => PickMediaRepository());
    getit.registerLazySingleton<UploadMediaRepository>(() => UploadMediaRepository());
    getit.registerLazySingleton<SubmitMediaRepository>(() => SubmitMediaRepository());
    getit.registerFactory<CameraBloc>(() => 
      CameraBloc(
      getit<PickMediaRepository>(), 
      getit<UploadMediaRepository>(),
      getit<Cloudinaryrepository>(),
      getit<FirebaseRepository>(),
      getit<SubmitMediaRepository>()));
}
