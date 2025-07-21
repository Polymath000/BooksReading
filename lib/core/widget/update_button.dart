import 'package:books_reading/core/models/book_model.dart';
import 'package:books_reading/core/widget/custom_button.dart';
import 'package:books_reading/features/home/presentation/cubit/book_manage/book_mange_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.formKey,
    required this.newbook,
    required this.oldBook,
    required this.onPressed,
  });

  final GlobalKey<FormState> formKey;
  final BookModel newbook;
  final BookModel oldBook;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          await BlocProvider.of<BookMangeCubit>(context).editBook(
            oldVersionOfTheBook: oldBook,
            newVersionOfTheBook: newbook,
          );
          Navigator.pop(context);
        } else {
          onPressed();
        }
      },
      title: 'Update',
    );
  }
}
