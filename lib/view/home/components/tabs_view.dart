import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/controller/supabase_controller.dart';
import 'package:get/get.dart';
import '../../../res/constants.dart';

class TabsView extends StatelessWidget {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SupabaseController>();

    // Select the "All" category chip by default when the widget is initialized
    

    return Wrap(
      
      spacing: 12.0,
      runSpacing: 4.0,
      children: categories.map((category) {
        return InkWell(
          onTap: () {
            controller.filterResourcesByCategory(category);
          },
          child: Obx(() => Chip(
                side:const BorderSide(color: iconColor),
                label: Text(category, style: normalText(18, controller.selectedChip.value == category?bgColor:textColor)),
                backgroundColor: controller.selectedChip.value == category
                    ? textColor
                    : bgColor,
              )),
        );
      }).toList(),
    );
  }
}
