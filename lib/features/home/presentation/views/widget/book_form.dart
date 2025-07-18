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
  BookForm({
    super.key,
    required this.name,
    required this.author,
    required this.category,
    required this.rating,
    required this.notes,
    required this.title,
  });
  String name;
  String author;
  String category;
  String rating;
  String title;
  String notes;
  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late BookModel oldVersionOfTheBook;
  @override
  void initState() {
    oldVersionOfTheBook = BookModel(
      name: widget.name,
      category: widget.category,
      author: widget.author,
      rate: widget.rating,
      notes: widget.notes,
    );
    // TODO: implement initState
    super.initState();
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
                widget.name = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
            intialValue: widget.name,
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
                widget.author = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is required';
              }
              return null;
            },
            intialValue: widget.author,
          ),

          SizedBox(height: 16),
          Category(
            onCategoryChanged: (value) {
              setState(() {
                widget.category = value;
              });
            },
          ),
          SizedBox(height: 16),

          Rating(
            onRatingChanged: (value) {
              setState(() {
                widget.rating = value;
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
                widget.notes = value!;
              });
            },
            validator: (p0) {},
            intialValue: widget.notes,
          ),
          SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BookModel book = BookModel(
                  name: widget.name,
                  category: widget.category,
                  author: widget.author,
                  rate: widget.rating,
                  notes: widget.notes,
                );
                if (widget.title == 'Update') {
                  BlocProvider.of<BookMangeCubit>(context).editBook(
                    oldVersionOfTheBook: oldVersionOfTheBook,
                    newVersionOfTheBook: book,
                  );
                } else {
                  BlocProvider.of<BookMangeCubit>(
                    context,
                  ).addNewBook(book: book);
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
