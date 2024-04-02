import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';

class CategoriesDropdown extends StatefulWidget {
  String? selectedCategory;
  final ValueChanged<String?>? onChanged;

   CategoriesDropdown({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  _CategoriesDropdownState createState() => _CategoriesDropdownState();
}

class _CategoriesDropdownState extends State<CategoriesDropdown> {



  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text(
        "Select category",
        style: normalText(16, textColor),
      ),
      dropdownColor: bgColor,
      style: normalText(16, textColor),
      value: widget.selectedCategory,
      onChanged:widget.onChanged,
      items: dropDownCategories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
    );
  }
}
