import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/themes/styles.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/widgets/custom_check_box.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../view_model/login_cubit/login_cubit.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          value: context.watch<LoginCubit>().isChecked,
          onChanged: (value) {
            context.read<LoginCubit>().rememberCheckBox();
          },
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: () {
            context.read<LoginCubit>().rememberCheckBox();
          },
          child: Text(
            'Remember Me',
            style: Styles.enRegular12().copyWith(color: AppColors.navy),
          ),
        ),
        const Spacer(),
        CustomText(
          text: 'Forget Password?',
          textStyle: Styles.enMedium12().copyWith(
            color: AppColors.lightBlue100,
          ),
        ),
      ],
    );
  }
}
