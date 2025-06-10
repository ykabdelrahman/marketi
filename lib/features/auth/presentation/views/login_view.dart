import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/features/auth/presentation/views/widgets/dont_have_account_row.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/keyboard_util.dart';
import '../../../../core/widgets/custom_button.dart';
import '../view_model/login_cubit/login_cubit.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/login_fields.dart';
import 'widgets/social_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Image.asset(Assets.logo, height: 250, width: 250),
                const LoginFields(),
                const SizedBox(height: 22),
                CustomButton(
                  text: 'Login',
                  onTap: () async {
                    if (context
                        .read<LoginCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      await context.read<LoginCubit>().login();
                    }
                  },
                ),
                const SizedBox(height: 16),
                SocialSection(),
                const SizedBox(height: 16),
                DontHaveAccountRow(
                  onTapSignUp: () {
                    KeyboardUtil.hideKeyboard(context);
                    context.push(Routes.signup);
                  },
                ),
                const SizedBox(height: 32),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
