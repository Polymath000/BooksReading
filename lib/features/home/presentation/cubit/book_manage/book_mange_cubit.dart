import 'package:bloc/bloc.dart';
import 'package:books_reading/core/constants/constants.dart';
import 'package:books_reading/core/models/book_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'book_mange_state.dart';

class BookMangeCubit extends Cubit<BookMangeState> {
  BookMangeCubit() : super(BookMangeInitial());
  var bookBox = Hive.box<BookModel>(kBoxName);

  Future<void> addNewBook({required BookModel book}) async {
    try {
      emit(BookMangeInitial());
      await bookBox.add(book);
      emit(BookMangeSuccess());
    } catch (e) {
      emit(BookMangeFailure(message: e.toString()));
    }
  }

  Future<void> removeBook({required BookModel book}) async {
    try {
      emit(BookMangeInitial());
      book.delete();
      emit(BookMangeSuccess());
    } catch (e) {
      emit(BookMangeFailure(message: e.toString()));
    }
  }

  Future<void> editBook({
    required BookModel oldVersionOfTheBook,
    required BookModel newVersionOfTheBook,
  }) async {
    try {
      emit(BookMangeInitial());
      await bookBox.put(oldVersionOfTheBook.key, newVersionOfTheBook);
      emit(BookMangeSuccess());
    } catch (e) {
      emit(BookMangeFailure(message: e.toString()));
    }
  }

  List<BookModel> books = [];
  List<BookModel> fetchAllBooks() {
    try {
      emit(BookMangeInitial());
      books = bookBox.values.toList();
      emit(BookMangeSuccess());
      return books;
    } catch (e) {
      emit(BookMangeFailure(message: e.toString()));
      return [];
    }
  }
}
