import 'package:flutter/material.dart';
import 'package:marketi/core/utils/validation.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'remember_me.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            hint: 'Email',
            validator: (value) {
              return validatEmptyField(value, fieldName: 'Email');
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: 'Password',
            hideText: true,
            isLastInput: true,
            validator: validatePassword,
          ),
          const SizedBox(height: 15),
          const RememberMeRow(),
        ],
      ),
    );
  }
}
