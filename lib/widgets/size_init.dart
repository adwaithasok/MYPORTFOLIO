import 'package:flutter/material.dart';
import '../utils/size_utils.dart';

class SizeInit extends StatelessWidget {
  final Widget child;

  const SizeInit({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return child;
  }
}
