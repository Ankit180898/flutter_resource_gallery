import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required this.desktop,
      required this.mobile,
      required this.tablet,
      this.extraLargeScreen});
  final Widget desktop;
  final Widget mobile;
  final Widget? tablet;
  final Widget? extraLargeScreen;

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 500;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 1080;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1024;
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 1080) {
      return desktop;
    } else if (size.width >= 700 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
