import 'package:books_reading/core/utls/app_colors.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({
    super.key,
    required this.data,
    required this.defaultText,
    required this.onChanged,
  });
  final List<SelectedListItem<String>> data;
  final String defaultText;
  final void Function(String)? onChanged;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  late String _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.defaultText;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.blue),
      foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
      padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    onPressed: () {
      DropDownState<String>(
        dropDown: DropDown<String>(
          data: widget.data,

          onSelected: (final selectedItems) {
            var list = <String>[];
            for (final item in selectedItems) {
              list.add(item.data);
            }
            setState(() {
              var temp = list.toString().substring(1);
              _selectedItem = temp.substring(0, temp.length - 1);
              if (widget.onChanged != null) {
                widget.onChanged!(_selectedItem);
              }
            });
          },
        ),
      ).showModal(context);
    },
    child: Text(_selectedItem),
  );
}
