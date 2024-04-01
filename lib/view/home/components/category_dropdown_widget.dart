import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';

class CategoriesDropdown extends StatefulWidget {

  @override
  _CategoriesDropdownState createState() => _CategoriesDropdownState();
}

class _CategoriesDropdownState extends State<CategoriesDropdown> {
  var selectedCategory;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
            isExpanded: true,
      hint: Text("Select category",style: normalText(16, textColor),),

      dropdownColor: bgColor,
      style: normalText(16, textColor),
      value: selectedCategory,
      onChanged: (String? newval){
                      setState((){
                        selectedCategory = newval;
                      });},

      items: dropDownCategories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
    );
  }
}
