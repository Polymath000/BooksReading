import 'package:books_reading/features/home/presentation/cubit/book_manage/book_mange_cubit.dart';
import 'package:books_reading/features/home/presentation/views/widget/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GirdCard extends StatefulWidget {
  const GirdCard({
    super.key,
    required GlobalKey<SliverAnimatedGridState> listKey,
  }) : _listKey = listKey;

  final GlobalKey<SliverAnimatedGridState> _listKey;

  @override
  State<GirdCard> createState() => _GirdCardState();
}

class _GirdCardState extends State<GirdCard> {
  @override
  void initState() {
    super.initState();
    context.read<BookMangeCubit>().fetchAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMangeCubit, BookMangeState>(
      builder: (context, state) {
        if (state is BookMangeloading) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is BookMangeSuccess) {
          if (state.books.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(child: Text('No Books Found!')),
            );
          } else {
            return SliverGrid(
              key: widget._listKey,
              delegate: SliverChildBuilderDelegate((context, index) {
                return state.books[index] != null
                    ? BookCard(index: index, book: state.books[index])
                    : Container();
              }, childCount: state.books.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                mainAxisExtent: 200,
              ),
            );
          }
        } else if (state is BookMangeFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.message.toString())),
          );
        } else {
          return SliverToBoxAdapter(child: Center(child: Text('Error!')));
        }
      },
    );
  }
}
