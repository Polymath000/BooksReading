import 'package:books_reading/core/helpers/category.dart';
import 'package:books_reading/core/helpers/rating.dart';
import 'package:books_reading/core/models/book_model.dart';
import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/core/widget/add_button.dart';
import 'package:books_reading/core/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class BookForm extends StatefulWidget {
  BookForm({super.key, required this.book});
  BookModel book;
  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
            onSaved: (value) {
              setState(() {
                widget.book.name = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
            intialValue: '',
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
            onSaved: (value) {
              setState(() {
                widget.book.author = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
            intialValue: '',
          ),

          SizedBox(height: 16),
          Category(
            onCategoryChanged: (value) {
              setState(() {
                widget.book.category = value;
              });
            },
            selectedCategory: 'History',
          ),
          SizedBox(height: 16),

          Rating(
            onRatingChanged: (value) {
              setState(() {
                widget.book.rate = value;
              });
            },
            selecteditem: '⭐⭐⭐',
          ),
          SizedBox(height: 16),
          CustomFormTextField(
            hint: 'Add Your Notes Here',
            keyboardType: TextInputType.text,
            maxLines: 15,
            onSaved: (value) {
              setState(() {
                widget.book.notes = value!;
              });
            },
            validator: (p0) {
              return null;
            },
            intialValue: widget.book.notes,
          ),
          SizedBox(height: 16),
          AddButton(
            formKey: formKey,
            newbook: widget.book,
            onPressed: () {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            },
          ),
        ],
      ),
    );
  }
}
