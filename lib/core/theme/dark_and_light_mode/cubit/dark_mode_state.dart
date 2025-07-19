part of 'dark_mode_cubit.dart';

@immutable
sealed class DarkModeState {
  ThemeData get themeData;
}

final class DarkModeLight extends DarkModeState {
  @override
  ThemeData get themeData => ThemeData.light();
}

final class DarkModeDark extends DarkModeState {
  @override
  ThemeData get themeData => ThemeData.dark();
}
