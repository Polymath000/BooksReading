import 'package:books_reading/core/theme/dark_and_light_mode/cubit/dark_mode_cubit.dart';
import 'package:books_reading/features/settings/presentation/views/widget/custom_buttom_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkOrLightButton extends StatelessWidget {
  const DarkOrLightButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButtomMode(
          text: "Dark",
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          onPressed: () {
            context.read<DarkModeCubit>().switchTheme();
          },
        ),
        CustomButtomMode(
          text: "Light",
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          onPressed: () {
            context.read<DarkModeCubit>().switchTheme();
          },
        ),
      ],
    );
  }
}
