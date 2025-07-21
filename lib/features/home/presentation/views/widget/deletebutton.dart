import 'package:books_reading/core/models/book_model.dart';
import 'package:books_reading/core/utls/app_colors.dart';
import 'package:books_reading/features/home/presentation/cubit/book_manage/book_mange_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Deletebutton extends StatelessWidget {
  const Deletebutton({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(Icons.delete, color: AppColors.black),

        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Are you sure?'),
              content: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        icon: Icon(Icons.delete_outline),
                        label: Text('Delete'),
                        onPressed: () {
                          BlocProvider.of<BookMangeCubit>(
                            context,
                          ).removeBook(book: book);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blueAccent,
                          side: BorderSide(color: Colors.blueAccent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        icon: Icon(Icons.close),
                        label: Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          BlocProvider.of<BookMangeCubit>(context).fetchAllBooks();
        },
      ),
    );
  }
}
