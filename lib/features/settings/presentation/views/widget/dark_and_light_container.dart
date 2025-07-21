import 'package:books_reading/core/extensions/theme_extension.dart';
import 'package:books_reading/core/theme/dark_and_light_mode/cubit/dark_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkAndLightContainer extends StatelessWidget {
  const DarkAndLightContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).isDark(context: context);
    final isSelected =
        (title == "Dark" && isDark) || (title == "Light" && !isDark);

    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: title == "Dark" ? Radius.circular(10) : Radius.circular(0),
          bottomLeft: title == "Dark"
              ? Radius.circular(10)
              : Radius.circular(0),
          topRight: title == "Dark" ? Radius.circular(0) : Radius.circular(10),
          bottomRight: title == "Dark"
              ? Radius.circular(0)
              : Radius.circular(10),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.only(
          topLeft: title == "Dark" ? Radius.circular(10) : Radius.circular(0),
          bottomLeft: title == "Dark"
              ? Radius.circular(10)
              : Radius.circular(0),
          topRight: title == "Dark" ? Radius.circular(0) : Radius.circular(10),
          bottomRight: title == "Dark"
              ? Radius.circular(0)
              : Radius.circular(10),
        ),
        onTap: () {
          final shouldSwitch =
              (title == "Dark" && !isDark) || (title == "Light" && isDark);
          if (shouldSwitch) {
            context.read<DarkModeCubit>().switchTheme();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              AnimatedOpacity(
                opacity: isSelected ? 1.0 : 0.5,
                duration: Duration(milliseconds: 400),
                child: Icon(
                  title == "Dark"
                      ? Icons.nightlight_round
                      : Icons.wb_sunny_rounded,
                  color: isSelected
                      ? Colors.white
                      : Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              SizedBox(width: 8),
              AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 400),
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
