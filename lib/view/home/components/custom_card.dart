import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../model/resource_model.dart';
import '../../../res/responsive.dart';
import '../../../res/size_helpers.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final ResourceModel resource;
  final RxBool isHovered; // GetX RxBool for hover state

  const CustomCard({super.key, 
    required this.index,
    required this.isHovered,
    required this.resource,
  });

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
        child: Responsive(
          extraLargeScreen: buildCard(context),
          tablet: buildCard(context),
          mobile: buildCard(context),
          desktop: buildCard(context),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: displayHeight(context) * 0.45,
      width: displayWidth(context) * 0.30,
      child: Stack(
        children: [
          Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                color: isHovered.value ? logoPrimaryColor : iconColor,
                width: isHovered.value ? 6 : 4,
              ),
            ),
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SvgPicture.asset(
                      "flutterdev_logo.svg",
                      height: displayHeight(context) * 0.40,
                      width: displayWidth(context) * 0.30, // Adjusted width
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: bgColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  resource.title,
                                  maxLines: 1,
                                  style: salutationTextStyle(
                                    18, // Adjusted font size

                                    textColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4), // Adjusted spacing
                                Text(
                                  resource.content,
                                  style: normalText(
                                    16, // Adjusted font size
                                    textColor,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16), // Adjusted spacing
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: displayHeight(context) * 0.06,
                              width: displayWidth(context) * 0.10,
                              decoration: BoxDecoration(
                                color: textColor,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Center(
                                child: Text(
                                  resource.category,
                                  style: salutationTextStyle(
                                    16, // Adjusted font size
                                    bgColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16, // Adjusted position
            top: 16, // Adjusted position
            child: Visibility(
              visible: isHovered.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.rectangle,
                  color: logoPrimaryColor,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: textColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
