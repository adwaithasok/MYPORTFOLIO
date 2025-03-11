import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget addInkWell(VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }
}
