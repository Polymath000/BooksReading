import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/core/widget/dropdown_menu.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  Rating({
    super.key,
    required this.onRatingChanged,
    required this.selecteditem,
  });
  final void Function(String)? onRatingChanged;
  String selecteditem;

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
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
            defaultText: widget.selecteditem,
            onChanged: (value) {
              setState(() {
                widget.selecteditem = value;
                widget.onRatingChanged!(value);
              });
            },
          ),
        ),
      ],
    );
  }
}
