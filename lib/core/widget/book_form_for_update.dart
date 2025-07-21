import 'package:books_reading/core/helpers/category.dart';
import 'package:books_reading/core/helpers/rating.dart';
import 'package:books_reading/core/models/book_model.dart';
import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/core/widget/custom_textfield.dart';
import 'package:books_reading/core/widget/update_button.dart';
import 'package:flutter/material.dart';

class BookFormForUpdate extends StatefulWidget {
  BookFormForUpdate({super.key, required this.book});
  BookModel book;
  @override
  State<BookFormForUpdate> createState() => _BookFormForUpdateState();
}

class _BookFormForUpdateState extends State<BookFormForUpdate> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name, author, category, rating, notes;

  @override
  void initState() {
    super.initState();
    name = widget.book.name;
    author = widget.book.author;
    category = widget.book.category;
    rating = widget.book.rate;
    notes = widget.book.notes;
  }

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
                name = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
            intialValue: name,
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
                author = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
            intialValue: author,
          ),

          SizedBox(height: 16),
          Category(
            onCategoryChanged: (value) {
              setState(() {
                category = value;
              });
            },
            selectedCategory: category,
          ),
          SizedBox(height: 16),
          Rating(
            onRatingChanged: (value) {
              setState(() {
                rating = value;
              });
            },
            selecteditem: rating,
          ),
          SizedBox(height: 16),
          CustomFormTextField(
            hint: 'Add Your Notes Here',
            keyboardType: TextInputType.text,
            maxLines: 15,
            onSaved: (value) {
              setState(() {
                notes = value!;
              });
            },
            validator: (p0) {
              return null;
            },
            intialValue: notes,
          ),
          SizedBox(height: 16),
          UpdateButton(
            formKey: formKey,
            oldBook: widget.book,
            newbook: BookModel(
              name: name,
              category: category,
              author: author,
              rate: rating,
              notes: notes,
            ),
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
