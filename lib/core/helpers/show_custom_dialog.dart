import 'package:books_reading/features/home/presentation/views/widget/book_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_reading/features/home/presentation/cubit/book_manage/book_mange_cubit.dart';

Future<dynamic> showCustomDialog({
  required BuildContext context,
  required String name,
  required String author,
  required String category,
  required String rate,
  required String note,
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
            child: BookForm(
              name: name,
              author: author,
              category: category,
              rating: rate,
              notes: note,
              title: title,
            ),
          ),
        ),
      ),
    ),
  );
}
