import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../res/constants.dart';
import '../../../res/responsive.dart';

class FooterContent extends StatelessWidget {
  const FooterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        desktop: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              thickness: 0.1,
              color: iconColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "© 2024 Ankit Kumar. All rights reserved.",
              style: normalText(15, textColor),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {
                  launchUrlString(
                      "https://github.com/Ankit180898/flutter_resource_gallery");
                },
                child: Text(
                  "View Source",
                  style: normalText(15, textColor),
                )),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        mobile: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              thickness: 0.1,
              color: iconColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "© 2024 Ankit Kumar. All rights reserved.",
              style: normalText(10, textColor),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {
                  launchUrlString(
                      "https://github.com/Ankit180898/flutter_resource_gallery");
                },
                child: Text(
                  "View Source",
                  style: normalText(10, textColor),
                )),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        tablet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              thickness: 0.1,
              color: iconColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "© 2024 Ankit Kumar. All rights reserved.",
              style: normalText(15, textColor),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {
                  launchUrlString(
                      "https://github.com/Ankit180898/flutter_resource_gallery");
                },
                child: Text(
                  "View Source",
                  style: normalText(15, textColor),
                )),
            const SizedBox(
              height: 5,
            ),
          ],
        ));
  }
}
