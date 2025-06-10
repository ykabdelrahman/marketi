import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/themes/app_colors.dart';
import 'package:marketi/core/utils/validation.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../view_model/signup_cubit/signup_cubit.dart';

class SignupFields extends StatelessWidget {
  const SignupFields({super.key});

  @override
  Widget build(BuildContext context) {
    var signupCubit = context.read<SignupCubit>();
    return Form(
      key: signupCubit.formKey,
      child: Column(
        children: [
          CustomSignUpField(
            text: 'Your Name',
            hint: 'Full Name',

            validator: (value) {
              return validatEmptyField(value, fieldName: 'Your Name');
            },
          ),
          const SizedBox(height: 8),
          CustomSignUpField(
            text: 'Username',
            hint: 'Username',
            controller: signupCubit.username,
            validator: (value) {
              return validatEmptyField(value, fieldName: 'Username');
            },
          ),
          const SizedBox(height: 8),
          CustomSignUpField(
            text: 'Phone Number',
            hint: '+20 1501142409',
            keyboardType: TextInputType.number,
            controller: signupCubit.phone,
            validator: validatePhone,
          ),
          const SizedBox(height: 8),
          CustomSignUpField(
            text: 'Email',
            hint: 'You@gmail.com',
            keyboardType: TextInputType.emailAddress,
            controller: signupCubit.email,
            validator: validateEmail,
          ),
          const SizedBox(height: 8),
          CustomSignUpField(
            text: 'Password',
            hint: '••••••••••••',
            hideText: context.watch<SignupCubit>().isPasswordSecure,
            suffixIcon: IconButton(
              onPressed: () => signupCubit.onPasswordEyeTap(),
              icon: Icon(
                context.watch<SignupCubit>().isPasswordSecure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.darkBlue900,
              ),
            ),
            controller: signupCubit.password,
            validator: validatePassword,
          ),
          const SizedBox(height: 8),
          CustomSignUpField(
            text: 'Confirm Password',
            hint: '••••••••••••',
            isLastInput: true,
            hideText: context.watch<SignupCubit>().isConPasswordSecure,
            suffixIcon: IconButton(
              onPressed: () => signupCubit.onConfirmPasswordEyeTap(),
              icon: Icon(
                context.watch<SignupCubit>().isConPasswordSecure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.darkBlue900,
              ),
            ),
            controller: signupCubit.confirmPassword,
            validator: (value) {
              return validateConfirmPassword(
                value,
                password: signupCubit.password.text,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomSignUpField extends StatelessWidget {
  const CustomSignUpField({
    super.key,
    this.keyboardType,
    this.suffixIcon,
    required this.text,
    this.hint,
    this.height = 40,
    this.maxLines = 1,
    this.hideText = false,
    this.controller,
    this.validator,
    this.isLastInput = false,
  });
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String text;
  final String? hint;
  final double? height;
  final int? maxLines;
  final bool? hideText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isLastInput;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: Styles.enMedium12().copyWith(color: AppColors.darkBlue900),
        ),
        const SizedBox(height: 4),
        CustomTextField(
          height: height,
          isLastInput: isLastInput,
          keyboardType: keyboardType,
          suffixIcon: suffixIcon,
          hint: hint,
          maxLines: maxLines,
          hideText: hideText,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}
