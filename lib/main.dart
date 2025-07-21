import 'package:books_reading/core/constants/constants.dart';
import 'package:books_reading/core/models/book_model.dart';
import 'package:books_reading/main-app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_reading/core/theme/dark_and_light_mode/cubit/dark_mode_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  await Hive.openBox<BookModel>(kBoxName);
  runApp(
    BlocProvider(create: (_) => DarkModeCubit(), child: const BookReading()),
  );
}
