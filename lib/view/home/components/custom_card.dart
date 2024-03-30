import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/controller/supabase_controller.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../model/resource_model.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final ResourceModel resource;
  RxBool isHovered; // GetX RxBool for hover state

  CustomCard(
      {super.key,
      required this.index,
      required this.isHovered,
      required this.resource});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SupabaseController>();
    var resourceList = controller.resourcesList[index];
    return Obx(
      () => InkWell(
        onHover: (val) {
          isHovered.value = val;
        },
        onTap: () {
          // Handle onTap if needed
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: displayHeight(context) * 0.50,
            width: displayWidth(context) * 0.30,
            child: Stack(
              children: [
                Card(
                  color: cardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(
                          color: isHovered.value ? logoPrimaryColor : iconColor,
                          width: isHovered.value ? 6 : 4)),
                  elevation: 4,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SvgPicture.asset(
                            "assets/flutterdev_logo.svg",
                            height: displayHeight(context) * 0.40,
                            width: MediaQuery.of(context).size.width * 0.60,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: primaryColor,
                          child: ListTile(
                            title: Text(
                              resourceList.title,
                              style: salutationTextStyle(24, textColor),
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                  color: textColor,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(
                                  child: Text(
                                    resourceList.category,
                                    style: salutationTextStyle(16, bgColor),
                                  ),
                                ),
                              ),
                            ),
                            subtitle: Text(
                              resourceList.content,
                              style: normalText(16, textColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: Visibility(
                    visible: isHovered.value,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          shape: BoxShape.rectangle,
                          color: logoPrimaryColor),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: textColor,
                          )),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
