part of 'book_mange_cubit.dart';

@immutable
sealed class BookMangeState {}

final class BookMangeInitial extends BookMangeState {}
final class BookMangeFailure extends BookMangeState {
  final String message;
  BookMangeFailure({required this.message});
}
final class BookMangeSuccess extends BookMangeState {}
final class BookMangeloading extends BookMangeState {}
