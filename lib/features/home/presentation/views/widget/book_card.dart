import 'package:books_reading/core/helpers/shape_decoration.dart';
import 'package:books_reading/core/helpers/show_custom_dialog.dart';
import 'package:books_reading/core/models/book_model.dart';
import 'package:books_reading/core/utls/app_colors.dart';
import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/features/home/presentation/views/widget/deletebutton.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.index, required this.book});
  final BookModel book;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCustomUpdateDialog(book: book, context: context);
      },
      child: Container(
        margin: index.isOdd
            ? EdgeInsets.only(right: 16)
            : EdgeInsets.only(left: 16),
        padding: EdgeInsets.all(10),
        decoration: shapeDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.name,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.titleMedium,
            ),
            SizedBox(height: 10),
            Text(
              book.author,
              style: AppTextStyles.bodyLarge!.copyWith(
                color: AppColors.waterBlue,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              book.category,
              style: AppTextStyles.bodyLarge!.copyWith(
                overflow: TextOverflow.ellipsis,
                color: AppColors.black,
              ),
            ),
            Text(book.rate, style: AppTextStyles.bodyLarge),
            Deletebutton(book: book),
          ],
        ),
      ),
    );
  }
}
