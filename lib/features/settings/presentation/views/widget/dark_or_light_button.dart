import 'package:books_reading/core/theme/dark_and_light_mode/cubit/dark_mode_cubit.dart';
import 'package:books_reading/features/settings/presentation/views/widget/dark_and_light_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkOrLightButton extends StatelessWidget {
  const DarkOrLightButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<DarkModeCubit, DarkModeState>(
          builder: (context, isDarkMode) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DarkAndLightContainer(title: 'Dark'),
                  DarkAndLightContainer(title: 'Light'),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
