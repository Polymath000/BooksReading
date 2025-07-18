import 'package:books_reading/features/home/presentation/cubit/book_manage/book_mange_cubit.dart';
import 'package:books_reading/features/home/presentation/views/widget/app_bar_home.dart';
import 'package:books_reading/features/home/presentation/views/widget/gird_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required GlobalKey<SliverAnimatedGridState> listKey,
  }) : _listKey = listKey;

  final GlobalKey<SliverAnimatedGridState> _listKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookMangeCubit(),
      child: CustomScrollView(
        slivers: [
          AppBarHome(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          GirdCard(listKey: _listKey),
          SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
    );
  }
}
