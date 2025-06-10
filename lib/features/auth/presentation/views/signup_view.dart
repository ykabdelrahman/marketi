import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/auth/presentation/views/widgets/signup_bloc_listener.dart';
import 'package:marketi/features/auth/presentation/views/widgets/signup_fields.dart';
import 'package:marketi/features/auth/presentation/views/widgets/social_section.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/custom_back.dart';
import '../../../../core/widgets/custom_button.dart';
import '../view_model/signup_cubit/signup_cubit.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Row(children: [const CustomBack()]),
                Image.asset(Assets.logo, height: 140, width: 160),
                const SignupFields(),
                const SizedBox(height: 22),
                CustomButton(
                  text: 'Sign Up',
                  onTap: () async {
                    if (context
                        .read<SignupCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      await context.read<SignupCubit>().signUp();
                    }
                  },
                ),
                const SizedBox(height: 16),
                const SocialSection(),
                const SizedBox(height: 32),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
