import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/core/widget/dropdown_menu.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({
    super.key,
    required this.onCategoryChanged,
    required this.selectedCategory,
  });
  final void Function(String)? onCategoryChanged;
  String selectedCategory;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Category:',
          style: AppTextStyles.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomDropdownMenu(
            data: [
              SelectedListItem<String>(data: 'History'),
              SelectedListItem<String>(data: 'CS'),
            ],
            defaultText: widget.selectedCategory,
            onChanged: (value) {
              setState(() {
                widget.selectedCategory = value;
                if (widget.onCategoryChanged != null) {
                  widget.onCategoryChanged!(value);
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
