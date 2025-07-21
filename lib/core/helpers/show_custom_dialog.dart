import 'package:books_reading/core/models/book_model.dart';
import 'package:books_reading/core/widget/book_form.dart';
import 'package:books_reading/core/widget/book_form_for_update.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_reading/features/home/presentation/cubit/book_manage/book_mange_cubit.dart';

Future<dynamic> showCustomAddDialog({
  required BuildContext context,
  required BookModel book,
  required String title,
}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Add New Book'),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: BlocProvider.value(
            value: BookMangeCubit(),
            child: BookForm(book: book),
          ),
        ),
      ),
    ),
  );
}

Future<dynamic> showCustomUpdateDialog({
  required BuildContext context,
  required BookModel book,
}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Update The Book'),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: BlocProvider.value(
            value: BookMangeCubit(),
            child: BookFormForUpdate(book: book),
          ),
        ),
      ),
    ),
  );
}
