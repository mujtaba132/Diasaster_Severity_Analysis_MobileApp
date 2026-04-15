import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Authentication/custom_widgets.dart/screen_Switch.dart';
import 'package:fyp_project/Pages/Authentication/mainAuth/bottomCard/createAccount_Btn.dart';
import 'package:fyp_project/Pages/Authentication/mainAuth/bottomCard/googleLogin_Btn.dart';
import 'package:fyp_project/blocs/login/login_bloc.dart';
import 'package:fyp_project/main.dart';
import 'package:fyp_project/responsible/mediaquery.dart';

class BottomCard extends StatefulWidget {
  const BottomCard({super.key});

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {

  late LoginBloc _loginbloc;

   @override
  void initState() {
    super.initState();
    _loginbloc= getit<LoginBloc>();
  }

  @override
  void dispose() {
    _loginbloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Responsive screen = Responsive(context);
    final ThemeData theme = Theme.of(context);

    return BlocProvider(
      create: (context) => _loginbloc,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: double.infinity,
          constraints: BoxConstraints(
          minHeight: screen.screenheight() * 0.45,
          maxHeight: screen.screenheight() * 0.60,
        ),
        padding: EdgeInsets.fromLTRB(
          screen.screenheight() * 0.035,
          screen.screenWidth() * 0.035,
          screen.screenheight() * 0.035,
          screen.screenWidth() * 0.035,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: theme.brightness == Brightness.dark
                  ? Colors.black54
                  : Colors.black26,
              blurRadius: 30,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [

               
              // Premium drag indicator
              Center(
                child: Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
          
              SizedBox(height:screen.screenheight() * 0.04),
          
              Text(
                "Get Started",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              SizedBox(height: screen.screenheight() * 0.022),
          
              Text(
                "Register for events and create images of activities you plan to attend.",
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
          
              SizedBox(height: screen.screenheight() * 0.030),
          
              CreateaccountBtn(),
          
              SizedBox(height: screen.screenheight() * 0.015),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("OR"),
                ],
              ),
          
              SizedBox(height: screen.screenheight() * 0.015),

              GoogleloginBtn(),
               
              SizedBox(height: screen.screenheight() * 0.042),
          
              
              ScreenSwitch(title: "Already have an account? ", btnName: 'Login', onTap: (){})
                
            ],
          ),
        )),
    );
  }
}
