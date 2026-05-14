import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationHistory/donation_history.dart';
import 'package:fyp_project/config/routes/routes_arguments/homepage_arguments.dart';
import 'package:fyp_project/config/routes/routes_arguments/userDonation_arguments.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/services/urls.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      //Auth Module
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesName.mainScreen:
        return MaterialPageRoute(builder: (_) => MainAuthScreen());
      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => SigninScreen());
      case RoutesName.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgetpasswordScreen());
      case RoutesName.homeScreen:
        final args = settings.arguments as HomePageArguments;
        return MaterialPageRoute(builder: (_) => HomeScreen(pages: args.pages));

      //NGO Module
      case RoutesName.registerNGOScreen:
        return MaterialPageRoute(builder: (_) => NGORegistrationScreen());
      case RoutesName.requestListNGOsScreen:
        return MaterialPageRoute(builder: (_) => NGORequestListScreen());
      case RoutesName.verifiedNGOsScreen:
        return MaterialPageRoute(builder: (_) => VerifiedNGOsListScreen());
      case RoutesName.detailNGOScreen:
        final args = settings.arguments as NgoDetailScreenArguments;
        return MaterialPageRoute(
          builder: (_) => NgoDetailScreen(
            ngo: args.ngoModel,
            requestNgoBloc: args.requestNgoBloc,
          ),
        );

      //Camera Module
      case RoutesName.imagePreviewScreen:
        final args = settings.arguments as ImagePreviewArguments;
        return MaterialPageRoute(
          builder: (_) => ImagePreviewScreen(
            file: args.file,
            isNetwork: args.isNetworkImage,
          ),
        );
      case RoutesName.videoPreviewScreen:
        final args = settings.arguments as VideoPreviewArguments;
        return MaterialPageRoute(
          builder: (_) => VideoPreviewScreen(
            filePath: args.file,
            isNetworkVideo: args.isNetworkVideo,
          ),
        );
      case RoutesName.cameraScreen:
        return MaterialPageRoute(builder: (_) => CameraScreen());

      // Upload Module
      case RoutesName.localUploadScreen:
        return MaterialPageRoute(builder: (_) => LocalUploadScreen());

      //Donation Module
      case RoutesName.userDonationScreen:
        final args = settings.arguments as UserdonationArguments;
        return MaterialPageRoute(
          builder: (_) =>
              DonationScreen(userId: args.userId, isAdmin: args.isAdmin),
        );

      //default case
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text("No Route Found!!"))),
        );
    }
  }
}
