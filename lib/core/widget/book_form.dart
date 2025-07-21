import 'package:books_reading/core/helpers/category.dart';
import 'package:books_reading/core/helpers/rating.dart';
import 'package:books_reading/core/models/book_model.dart';
import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/core/widget/custom_button.dart';
import 'package:books_reading/core/widget/custom_textfield.dart';
import 'package:books_reading/features/home/presentation/cubit/book_manage/book_mange_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookForm extends StatefulWidget {
  BookForm({super.key, required this.book, required this.title});
  BookModel book;
  String title;
  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
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
          ),
          SizedBox(height: 16),

          Rating(
            onRatingChanged: (value) {
              setState(() {
                rating = value;
              });
            },
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
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BookModel newBook = BookModel(
                  name: name,
                  author: author,
                  category: category,
                  rate: rating,
                  notes: notes,
                );
                if (widget.title == 'Update') {
                  BlocProvider.of<BookMangeCubit>(context).editBook(
                    oldVersionOfTheBook: widget.book,
                    newVersionOfTheBook: newBook,
                  );
                } else {
                  BlocProvider.of<BookMangeCubit>(
                    context,
                  ).addNewBook(book: newBook);
                }
                Navigator.pop(context);
                BlocProvider.of<BookMangeCubit>(context).fetchAllBooks();
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            title: widget.title,
          ),
        ],
      ),
    );
  }
}
