import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/func/loading_dialog.dart';
import '../../../../../core/func/show_snackbar.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/keyboard_util.dart';
import '../../view_model/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is LoginLoading ||
              current is LoginSuccess ||
              current is LoginFailure,
      listener: (context, state) {
        if (state is LoginLoading) {
          KeyboardUtil.hideKeyboard(context);
          loadingDialog(context);
        } else if (state is LoginFailure) {
          context.pop();
          showSnackBar(context, state.error);
        } else if (state is LoginSuccess) {
          context.pop();
          context.go(Routes.home);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
