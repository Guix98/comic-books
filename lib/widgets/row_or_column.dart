import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowOrColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  const RowOrColumn(
      {super.key,
      required this.children,
      this.mainAxisAlignment,
      this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    if (screenWidth < 600.0) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: children,
      );
    } else {
      return Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: children,
      );
    }
  }
}
