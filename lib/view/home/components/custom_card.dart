import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';
import 'package:get/get.dart';

import '../../../controller/hover_controller.dart';

class CustomCard extends StatelessWidget {
  final int index;
  RxBool isHovered; // GetX RxBool for hover state

  CustomCard({super.key, required this.index, required this.isHovered});

  @override
  Widget build(BuildContext context) {
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
                          color:
                              isHovered.value ? Colors.blueAccent : iconColor,
                          width: isHovered.value ? 6 : 4)),
                  elevation: 4,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/logo.png",
                            height: displayHeight(context) * 0.20,
                            width: MediaQuery.of(context).size.width * 0.20,
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
                              'Magazine Name',
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
                                    'YT Channel',
                                    style: salutationTextStyle(16, bgColor),
                                  ),
                                ),
                              ),
                            ),
                            subtitle: Text(
                              "asdasdas",
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
                          color: iconColor),
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
