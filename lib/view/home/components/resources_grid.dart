import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/controller/supabase_controller.dart';
import 'package:flutter_resource_gallery/view/home/components/custom_card.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
            ? GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: displayWidth(context) * 0.02,
                  crossAxisSpacing: displayWidth(context) * 0.02,
                ),
                itemCount: controller.resourcesList.length,
                itemBuilder: (BuildContext context, int index) {
                  final resource = controller.resourcesList[
                      index]; // Assuming `resourcesList` contains your `ResourceModel` instances

                  return CustomCard(
                    index: index,
                    isHovered: RxBool(false),
                    resource:
                        resource, // Initialize the hover state with GetX RxBool
                  );
                },
              )
            : Center(child: Lottie.asset('assets/logo_animation.json',fit: BoxFit.scaleDown,height: displayHeight(context)*0.25)),
      ),
    );
  }
}
