import 'package:books_reading/core/helpers/show_custom_dialog.dart';
import 'package:books_reading/core/models/book_model.dart';
import 'package:books_reading/core/utls/app_colors.dart';
import 'package:books_reading/features/home/presentation/cubit/book_manage/book_mange_cubit.dart';
import 'package:books_reading/features/home/presentation/views/widget/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  static const routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final GlobalKey<SliverAnimatedGridState> _listKey =
      GlobalKey<SliverAnimatedGridState>();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onFabPressed() async {
    if (_controller.isCompleted) {
      await _controller.reverse();
    } else {
      await _controller.forward();
    }
    showCustomAddDialog(
      context: context,
      book: BookModel(
        name: '',
        author: '',
        category: 'History',
        rate: '⭐⭐⭐',
        notes: '',
      ),
      title: 'Add new book',
    );
  }

  AnimatedBuilder AnimateFloatingActionButton() {
    return AnimatedBuilder(
      animation: _controller,
      child: Icon(Icons.add, color: AppColors.white),

      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.1416,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.blue,
        tooltip: 'Add New Book',
        elevation: 6,
        extendedPadding: EdgeInsets.only(right: 10, left: 16),
        onPressed: _onFabPressed,
        icon: AnimateFloatingActionButton(),
        label: Text(''),
      ),
      body: BlocProvider(
        create: (context) => BookMangeCubit(),
        child: HomeViewBody(listKey: _listKey),
      ),
    );
  }
}
