part of 'book_mange_cubit.dart';

@immutable
sealed class BookMangeState {}

final class BookMangeIntial extends BookMangeState {}

final class BookMangeFailure extends BookMangeState {
  final String message;
  BookMangeFailure({required this.message});
}

final class BookMangeSuccess extends BookMangeState {
  final List<BookModel> books;
  BookMangeSuccess({required this.books});
}

final class BookMangeloading extends BookMangeState {}
