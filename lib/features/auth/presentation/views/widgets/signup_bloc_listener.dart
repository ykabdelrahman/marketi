import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/func/loading_dialog.dart';
import '../../../../../core/func/show_snackbar.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/keyboard_util.dart';
import '../../view_model/signup_cubit/signup_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen:
          (previous, current) =>
              current is SignupLoading ||
              current is SignupSuccess ||
              current is SignupFailure,
      listener: (context, state) {
        if (state is SignupLoading) {
          KeyboardUtil.hideKeyboard(context);
          loadingDialog(context);
        } else if (state is SignupFailure) {
          context.pop();
          showSnackBar(context, state.error);
        } else if (state is SignupSuccess) {
          context.pop();
          showSnackBar(context, state.message);
          context.go(Routes.login);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
