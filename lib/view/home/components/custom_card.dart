import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/controller/supabase_controller.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
    return Obx(
      () => InkWell(
        onHover: (val) {
          isHovered.value = val;
        },
        onTap: () {
          launchUrlString(resource.url);
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
                              title: SizedBox(
                                width: displayWidth(context) *
                                    0.40, // Set a maximum width
                                child: Text(
                                  resource.title,
                                  style: salutationTextStyle(24, textColor),
                                  overflow: TextOverflow
                                      .ellipsis, // Handle overflow with ellipsis
                                ),
                              ),
                              trailing: SizedBox(
                                width: displayWidth(context) * 0.25,
                                child: Container(
                                  height: displayHeight(context) * 0.05,
                                  width: displayWidth(context) * 0.07,
                                  decoration: BoxDecoration(
                                      color: textColor,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Text(
                                      resource.category,
                                      style: salutationTextStyle(16, bgColor),
                                    ),
                                  ),
                                ),
                              ),
                              subtitle: SizedBox(
                                width: displayWidth(context) *
                                    0.40, // Set a maximum width
                                child: Text(
                                  resource.content,
                                  style: normalText(16, textColor),
                                  maxLines: 3,
                                  overflow: TextOverflow
                                      .ellipsis, // Handle overflow with ellipsis
                                ),
                              ),
                            )),
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
