import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/register_ngo/register_ngo_bloc.dart';
import 'package:fyp_project/config/Components/CustomTextFeild.dart';
import 'package:fyp_project/utils/validation.dart';

class NGONameField extends StatelessWidget {
  const NGONameField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterNgoBloc, RegisterNgoState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return CustomTextFormField(
          label: "NGO Name",
          prefixIcon: Icons.business,
          onChanged: (value) {
            context.read<RegisterNgoBloc>().add(
              OnChangedNameEvent(name: value ?? ''),
            );
          },
          onValidation: (value) {
           return AppValidations.validateRequiredFeild(value);
          },
        );
      },
    );
  }
}

class AddressField extends StatelessWidget {
  const AddressField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterNgoBloc, RegisterNgoState>(
      buildWhen: (previous, current) => previous.address != current.address,
      builder: (context, state) {
        return CustomTextFormField(
          label: "Address",
          prefixIcon: Icons.location_on,
          onChanged: (value) {
            context.read<RegisterNgoBloc>().add(
              OnChangedAddressEvent(address: value ?? ''),
            );
          },
          onValidation: (value) {
           return AppValidations.validateRequiredFeild(value);
          },
        );
      },
    );
  }
}

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterNgoBloc, RegisterNgoState>(
      buildWhen: (previous, current) => previous.phoneNo!=current.phoneNo,
      builder: (context, state) {
        return CustomTextFormField(
          label: "Phone No.",
          textInputType: TextInputType.phone,
          prefixIcon: Icons.phone,
          onChanged: (value) {
             context.read<RegisterNgoBloc>().add(
              OnChangedPhoneNoEvent(phoneNo: value ?? ''));
          },
          onValidation: (value) {
               return AppValidations.validatePhoneNo(value);
          },
        );
      },
    );
  }
}
