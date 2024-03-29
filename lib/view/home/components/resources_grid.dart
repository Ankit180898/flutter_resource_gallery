import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/view/home/components/custom_card.dart';
import 'package:get/get.dart';

import '../../../res/size_helpers.dart';

class ResourcesGrid extends StatelessWidget {
  const ResourcesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          mainAxisSpacing: displayWidth(context) * 0.02,
          crossAxisSpacing: displayWidth(context) * 0.02,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return CustomCard(
            index: index,
            isHovered:
                RxBool(false), // Initialize the hover state with GetX RxBool
          );
        },
      ),
    );
  }
}
