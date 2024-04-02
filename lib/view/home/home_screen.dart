import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';
import 'package:flutter_resource_gallery/view/home/components/footer_content.dart';
import 'package:flutter_resource_gallery/view/home/components/resources_grid.dart';
import 'package:get/get.dart';

import '../../controller/supabase_controller.dart';
import '../../res/responsive.dart';
import 'components/tabs_view.dart';
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
              height: Responsive.isDesktop(context)
                  ? displayHeight(context) * 0.06
                  : displayHeight(context) * 0.03,
            ),
            MainHeaderText(),
            SizedBox(
              height: Responsive.isDesktop(context)
                  ? displayHeight(context) * 0.07
                  : displayHeight(context) * 0.06,
            ),
            const TabsView(),
            SizedBox(
              height: Responsive.isDesktop(context)
                  ? displayHeight(context) * 0.07
                  : displayHeight(context) * 0.06,
            ),
            const SingleChildScrollView(child: ResourcesGrid()),
            SizedBox(
              height: Responsive.isDesktop(context)
                  ? displayHeight(context) * 0.10
                  : displayHeight(context) * 0.06,
            ),
            const FooterContent()
          ],
        ),
      ),
    );
  }
}
