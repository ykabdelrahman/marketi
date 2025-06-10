import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/validation.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../view_model/login_cubit/login_cubit.dart';
import 'remember_me.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: 'Email',
            controller: context.read<LoginCubit>().email,
            validator: (value) {
              return validatEmptyField(value, fieldName: 'Email');
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: 'Password',
            hideText: true,
            isLastInput: true,
            controller: context.read<LoginCubit>().password,
            validator: validatePassword,
          ),
          const SizedBox(height: 15),
          const RememberMeRow(),
        ],
      ),
    );
  }
}
