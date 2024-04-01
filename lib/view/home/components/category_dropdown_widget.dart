import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';

class CategoriesDropdown extends StatefulWidget {
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String?>? onChanged;

  const CategoriesDropdown({
    required this.categories,
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
      dropdownColor: bgColor,
      
      style: normalText(16, textColor),
      
      value: widget.selectedCategory,
      onChanged: widget.onChanged,
      items: widget.categories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
    );
  }
}
