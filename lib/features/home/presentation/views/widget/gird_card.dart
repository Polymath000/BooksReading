import 'package:books_reading/features/home/presentation/cubit/book_manage/book_mange_cubit.dart';
import 'package:books_reading/features/home/presentation/views/widget/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GirdCard extends StatelessWidget {
  const GirdCard({
    super.key,
    required GlobalKey<SliverAnimatedGridState> listKey,
  }) : _listKey = listKey;

  final GlobalKey<SliverAnimatedGridState> _listKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMangeCubit, BookMangeState>(
      builder: (context, state) {
        final cubit = context.read<BookMangeCubit>();
        final books = cubit.fetchAllBooks();
        return SliverGrid(
          key: _listKey,
          delegate: SliverChildBuilderDelegate((context, index) {
            return BookCard(index: index, book: books[index]);
          }, childCount: books.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            mainAxisExtent: 200,
          ),
        );
      },
    );
  }
}
