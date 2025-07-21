import 'package:bloc/bloc.dart';
import 'package:books_reading/core/constants/constants.dart';
import 'package:books_reading/core/models/book_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'book_mange_state.dart';

class BookMangeCubit extends Cubit<BookMangeState> {
  BookMangeCubit() : super(BookMangeIntial()) {
    fetchBooksOnStart();
  }
  var bookBox = Hive.box<BookModel>(kBoxName);

  void fetchBooksOnStart() {
    emit(BookMangeloading());
    final books = fetchAllBooks();
    emit(BookMangeSuccess(books: books));
  }

  Future<void> addNewBook({required BookModel book}) async {
    try {
      emit(BookMangeloading());
      await bookBox.add(book);
      fetchAllBooks();
      emit(BookMangeSuccess(books: books));
    } catch (e) {
      emit(BookMangeFailure(message: e.toString()));
    }
  }

  Future<void> removeBook({required BookModel book}) async {
    try {
      emit(BookMangeloading());
      await book.delete();
      fetchAllBooks();
      emit(BookMangeSuccess(books: books));
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
      fetchAllBooks();
      emit(BookMangeSuccess(books: books));
    } catch (e) {
      emit(BookMangeFailure(message: e.toString()));
    }
  }

  List<BookModel> books = [];

  List<BookModel> fetchAllBooks() {
    books = bookBox.values.toList();
    return books;
  }
}
