import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/NGOs/NGOsRequest/NGOTextFeilds.dart';
import 'package:fyp_project/Pages/NGOs/NGOsRequest/bank_details.dart';
import 'package:fyp_project/Pages/NGOs/NGOsRequest/submit_Btn.dart';
import 'package:fyp_project/Pages/NGOs/NGOsRequest/upload_certificate.dart';
import 'package:fyp_project/blocs/register_ngo/register_ngo_bloc.dart';
import 'package:fyp_project/main.dart';

class NGORegistrationScreen extends StatefulWidget {
  const NGORegistrationScreen({super.key});

  @override
  State<NGORegistrationScreen> createState() => _NGORegistrationScreenState();
}

class _NGORegistrationScreenState extends State<NGORegistrationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late RegisterNgoBloc _registerNgoBloc;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
    _registerNgoBloc = getit<RegisterNgoBloc>();
  }

  @override
  void dispose() {
    _controller.dispose();
    _registerNgoBloc.close();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NGO Registration"),
        elevation: 0,
      ),
      body: FadeTransition(
        opacity: _controller,
        child: BlocProvider.value(
          value: _registerNgoBloc,
          child: SingleChildScrollView(
  padding: const EdgeInsets.all(16),
  child: ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height-180 -
          kToolbarHeight,
    ),
    child: IntrinsicHeight(
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Register your NGO to connect, collaborate, and make a greater impact in helping those in need."),
              SizedBox(height: 40),
              NGONameField(),
              SizedBox(height: 16),
              AddressField(),
              SizedBox(height: 16),
              PhoneField(),
              SizedBox(height: 16),
              BankDetailsSection(),
              SizedBox(height: 16),
              CertificateUpload(),
              SizedBox(height: 30),
              SubmitButton(formKey: formKey),
            ],
          ),
        ),
      ),
    ),
  ),
) ),
      ),
    );
  }
}




