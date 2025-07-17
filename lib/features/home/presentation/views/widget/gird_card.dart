import 'package:books_reading/core/helpers/shape_decoration.dart';
import 'package:books_reading/core/utls/app_colors.dart';
import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:flutter/material.dart';

class GirdCard extends StatelessWidget {
  const GirdCard({
    super.key,
    required GlobalKey<SliverAnimatedGridState> listKey,
  }) : _listKey = listKey;

  final GlobalKey<SliverAnimatedGridState> _listKey;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      key: _listKey,
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          margin: index.isOdd
              ? EdgeInsets.only(right: 16)
              : EdgeInsets.only(left: 16),
          padding: EdgeInsets.all(10),
          decoration: shapeDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Code Bad Code',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.titleMedium,
              ),
              SizedBox(height: 10),
              Text(
                'Person And Person',
                style: AppTextStyles.bodyLarge!.copyWith(
                  color: AppColors.cyan,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Category',
                style: AppTextStyles.bodyLarge!.copyWith(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.darkGrey,
                ),
              ),
              Text('⭐⭐⭐⭐⭐', style: AppTextStyles.bodyLarge),
            ],
          ),
        );
      }, childCount: 12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        mainAxisExtent: 150,
      ),
    );
  }
}
