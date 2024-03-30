import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';
import 'package:flutter_resource_gallery/view/home/components/custom_card.dart';
import 'package:flutter_resource_gallery/view/home/components/resources_grid.dart';
import 'package:get/get.dart';

import '../../controller/supabase_controller.dart';
import 'components/main_header_text.dart';
import 'components/top_nav_contents.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupabaseController());
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopNavContents(),
            SizedBox(
              height: displayHeight(context) * 0.06,
            ),
            MainHeaderText(),
            SizedBox(
              height: displayHeight(context) * 0.10,
            ),
            ResourcesGrid()
          ],
        ),
      ),
    );
  }
}
