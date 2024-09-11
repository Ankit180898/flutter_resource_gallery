import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/controller/supabase_controller.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/view/home/components/custom_card.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../res/responsive.dart';
import '../../../res/size_helpers.dart';

class ResourcesGrid extends StatelessWidget {
  const ResourcesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SupabaseController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
      child: Obx(
        () => controller.isLoading.value == false
            ? Responsive(
                tablet: RawScrollbar(
                  thumbVisibility: true,
                  thumbColor: iconColor,
                  radius: const Radius.circular(8),
                  thickness: 4,
                  controller: ScrollController(),
                  child: GridView.builder(
                    controller: ScrollController(),
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      mainAxisSpacing: displayWidth(context) * 0.02,
                      crossAxisSpacing: displayWidth(context) * 0.02,
                    ),
                    itemCount: controller.filteredResourcesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final resource = controller.filteredResourcesList[index];
                      return CustomCard(
                        index: index,
                        isHovered: RxBool(false),
                        resource: resource,
                      );
                    },
                  ),
                ),
                mobile: RawScrollbar(
                  thumbVisibility: true,
                  thumbColor: iconColor,
                  radius: const Radius.circular(8),
                  thickness: 4,
                  interactive: true,
                  controller: ScrollController(),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: displayWidth(context) * 0.02,
                      crossAxisSpacing: displayWidth(context) * 0.02,
                    ),
                    itemCount: controller.filteredResourcesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final resource = controller.filteredResourcesList[index];
                      return CustomCard(
                        index: index,
                        isHovered: RxBool(false),
                        resource: resource,
                      );
                    },
                  ),
                ),
                desktop: RawScrollbar(
                  thumbVisibility: true,
                  interactive: true,
                  thumbColor: Colors.redAccent.withOpacity(
                      0.9), // Higher contrast color and more opaque
                  radius: const Radius.circular(
                      12), // Increased radius for visibility
                  thickness: 10, // Increased thickness for better visibility
                  controller:
                      ScrollController(), // Link the same ScrollController
                  child: GridView.builder(
                    controller: ScrollController(
                        keepScrollOffset:
                            true), // Same ScrollController for the grid
                    physics:
                        const AlwaysScrollableScrollPhysics(), // Ensure it's scrollable
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isDesktop(context) ? 3 : 1,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: displayWidth(context) * 0.02,
                      crossAxisSpacing: displayWidth(context) * 0.02,
                    ),
                    itemCount: controller.filteredResourcesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final resource = controller.filteredResourcesList[index];
                      return CustomCard(
                        index: index,
                        isHovered: RxBool(false),
                        resource: resource,
                      );
                    },
                  ),
                ))
            : Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width:
                      displayWidth(context) * 0.2, // Adjust the size as needed
                  height:
                      displayHeight(context) * 0.2, // Adjust the size as needed
                  child: Lottie.asset(
                    'logo_animation.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
    );
  }
}
