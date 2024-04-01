import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/res/responsive.dart';
import 'package:flutter_resource_gallery/res/size_helpers.dart';
import 'package:flutter_resource_gallery/view/home/components/custom_button.dart';
import 'package:flutter_resource_gallery/view/home/components/submission_form.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TopNavContents extends StatelessWidget {
  const TopNavContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Container(
        height: displayHeight(context) * 0.15,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),
                    SvgPicture.asset(
                      "assets/flutterstack.svg",
                      height: displayHeight(context) * 0.05,
                      width: displayWidth(context) * 0.07,
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          launchUrlString(
                              "https://ankitdev18.netlify.app/#/minified:Ds");
                        },
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "About",
                              style: normalText(20, textColor),
                            ))),
                    const SizedBox(
                      width: 8.0,
                    ),
                    CustomButton(
                      textSize: 24,
                      text: "Submit Resource",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                  
                                  elevation: 4,
                                  backgroundColor: Colors.transparent,
                                  child: SubmissionFrom());
                            });
                      },
                      color: textColor,
                      height: displayHeight(context) * 0.06,
                      width: displayWidth(context) * 0.12,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.05),
                child: Divider(
                  thickness: 0.3,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
      tablet: Container(
        height: displayHeight(context) * 0.15,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),
                    SvgPicture.asset(
                      "assets/flutterstack.svg",
                      height: displayHeight(context) * 0.03,
                      width: displayWidth(context) * 0.05,
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          launchUrlString(
                              "https://ankitdev18.netlify.app/#/minified:Ds");
                        },
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "About",
                              style: normalText(20, textColor),
                            ))),
                    const SizedBox(
                      width: 8.0,
                    ),
                    CustomButton(
                      textSize: 18,
                      text: "Submit Resource",
                      onPressed: () {
                         showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                  
                                  elevation: 4,
                                  backgroundColor: Colors.transparent,
                                  child: SubmissionFrom());
                            });
                      },
                      color: textColor,
                      height: displayHeight(context) * 0.06,
                      width: displayWidth(context) * 0.15,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.05),
                child: Divider(
                  thickness: 0.3,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
      mobile: Container(
        height: displayHeight(context) * 0.12,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),
                    SvgPicture.asset(
                      "assets/flutterdev_logo.svg",
                      height: displayHeight(context) * 0.05,
                      width: displayWidth(context) * 0.07,
                    ),
                    Spacer(),
                    CustomButton(
                      textSize: 18,
                      text: "Submit Resource",
                      onPressed: () {
                         showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                  
                                  elevation: 4,
                                  backgroundColor: Colors.transparent,
                                  child: SubmissionFrom());
                            });
                      },
                      color: textColor,
                      height: displayHeight(context) * 0.06,
                      width: displayWidth(context) * 0.30,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.05),
                child: Divider(
                  thickness: 0.3,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
