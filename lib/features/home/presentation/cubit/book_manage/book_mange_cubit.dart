import 'package:bloc/bloc.dart';
import 'package:books_reading/core/constants/constants.dart';
import 'package:books_reading/core/models/book_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
part 'book_mange_state.dart';

class BookMangeCubit extends Cubit<BookMangeState> {
  BookMangeCubit() : super(BookMangeIntial()) {
    _bookBoxListenable.addListener(_onBoxChanged);
    fetchAllBooks();
  }
  var bookBox = Hive.box<BookModel>(kBoxName);
  final ValueListenable _bookBoxListenable = Hive.box<BookModel>(
    kBoxName,
  ).listenable();
  void _onBoxChanged() {
    fetchAllBooks();
  }

  @override
  Future<void> close() {
    _bookBoxListenable.removeListener(_onBoxChanged);
    return super.close();
  }

  Future<void> addNewBook({required BookModel book}) async {
    try {
      emit(BookMangeloading());
      await bookBox.add(book);
    } catch (e) {
      emit(BookMangeFailure(message: e.toString()));
    }
  }

  Future<void> removeBook({required BookModel book}) async {
    try {
      emit(BookMangeloading());
      await book.delete();
    } catch (e) {
      emit(BookMangeFailure(message: e.toString()));
    }
  }

  Future<void> editBook({
    required BookModel oldVersionOfTheBook,
    required BookModel newVersionOfTheBook,
  }) async {
    try {
      emit(BookMangeloading());
      await bookBox.put(oldVersionOfTheBook.key, newVersionOfTheBook);
    } catch (e) {
      emit(BookMangeFailure(message: e.toString()));
    }
  }

  List<BookModel> books = [];

  void fetchAllBooks() async {
    emit(BookMangeloading());
    books = bookBox.values.toList();
    emit(BookMangeSuccess(books: books));
  }
}
