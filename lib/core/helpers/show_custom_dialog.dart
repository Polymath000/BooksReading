import 'package:books_reading/core/helpers/category.dart';
import 'package:books_reading/core/helpers/rating.dart';
import 'package:books_reading/core/utls/app_colors.dart';
import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/core/widget/custom_button.dart';
import 'package:books_reading/core/widget/custom_textfield.dart';

import 'package:flutter/material.dart';

Future<dynamic> showCustomDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Add New Book'),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book Title',
                style: AppTextStyles.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              CustomFormTextField(
                hint: 'Book Name',
                keyboardType: TextInputType.text,
              ),

              SizedBox(height: 16),

              Text(
                'Author',
                style: AppTextStyles.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              CustomFormTextField(
                hint: 'Author Name',
                keyboardType: TextInputType.text,
              ),

              SizedBox(height: 16),
              Category(),
              SizedBox(height: 16),

              Rating(),
              SizedBox(height: 16),
              CustomFormTextField(
                hint: 'Add Your Notes Here',
                keyboardType: TextInputType.text,
                maxLines: 15,
              ),
              SizedBox(height: 16),

              CustomButton(),
            ],
          ),
        ),
      ),
    ),
  );
}
