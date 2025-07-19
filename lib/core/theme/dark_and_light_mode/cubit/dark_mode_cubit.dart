import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dark_mode_state.dart';

class DarkModeCubit extends Cubit<DarkModeState> {
  DarkModeCubit() : super(DarkModeLight());

  void switchTheme() {
    if (state is DarkModeLight) {
      emit(DarkModeDark());
    } else {
      emit(DarkModeLight());
    }
  }
}
