import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/controller/supabase_controller.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/view/home/components/custom_card.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../res/responsive.dart';
import '../../../res/size_helpers.dart';

class ResourcesGrid extends StatelessWidget {
  ResourcesGrid({super.key});
  // Custom ScrollController
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final controller = Get.find<SupabaseController>();
    // Detect when the user reaches the bottom of the scroll
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        controller
            .loadMoreResources(); // Call load more when scrolled to bottom
      }
    });
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
      child: Obx(
        () => controller.isLoading.value == false
            ? Responsive(
                tablet: GridView.builder(
                  controller: scrollController,
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
                mobile: GridView.builder(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
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
                desktop: Column(
                  children: [
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: scrollController,
                        child: GridView.builder(
                          controller:
                              scrollController, // Same ScrollController for the grid
                          physics:
                              const AlwaysScrollableScrollPhysics(), // Ensure it's scrollable
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                Responsive.isDesktop(context) ? 3 : 1,
                            childAspectRatio: 0.7,
                            mainAxisSpacing: displayWidth(context) * 0.02,
                            crossAxisSpacing: displayWidth(context) * 0.02,
                          ),
                          itemCount: controller.filteredResourcesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final resource =
                                controller.filteredResourcesList[index];
                            return CustomCard(
                              index: index,
                              isHovered: RxBool(false),
                              resource: resource,
                            );
                          },
                        ),
                      ),
                    ),
                    if (controller.isLoading.value == true)
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: displayWidth(context) *
                              0.2, // Adjust the size as needed
                          height: displayHeight(context) *
                              0.2, // Adjust the size as needed
                          child: Lottie.asset(
                            'logo_animation.json',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    else if (controller.resourcesList.length >=
                        scrollController.position.maxScrollExtent)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: controller.loadMoreResources,
                          child: const Text('Load More'),
                        ),
                      ),
                  ],
                ),
              )
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
