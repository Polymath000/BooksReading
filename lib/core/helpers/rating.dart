import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/core/widget/dropdown_menu.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rating:',
          style: AppTextStyles.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomDropdownMenu(
            data: [
              SelectedListItem<String>(data: '⭐⭐⭐⭐⭐'),
              SelectedListItem<String>(data: '⭐⭐⭐⭐'),
              SelectedListItem<String>(data: '⭐⭐⭐'),
              SelectedListItem<String>(data: '⭐⭐'),
              SelectedListItem<String>(data: '⭐'),
            ],
            defaultText: '⭐⭐⭐',
          ),
        ),
      ],
    );
  }
}
