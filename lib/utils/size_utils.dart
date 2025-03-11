import 'package:flutter/material.dart';

class SizeUtils {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

    // Chia màn hình thành 100 blocks
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    // Safe area values
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  // Responsive font size
  static double getFontSize(double size) {
    return size * blockSizeHorizontal;
  }

  // Responsive padding
  static EdgeInsets getPadding(double horizontal, double vertical) {
    return EdgeInsets.symmetric(
      horizontal: horizontal * blockSizeHorizontal,
      vertical: vertical * blockSizeVertical,
    );
  }

  // Responsive margin
  static EdgeInsets getMargin(double horizontal, double vertical) {
    return EdgeInsets.symmetric(
      horizontal: horizontal * blockSizeHorizontal,
      vertical: vertical * blockSizeVertical,
    );
  }

  // Responsive height
  static double getHeight(double height) {
    return height * blockSizeVertical;
  }

  // Responsive width
  static double getWidth(double width) {
    return width * blockSizeHorizontal;
  }

  // Check if device is mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  // Check if device is tablet
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  // Check if device is desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  // Get screen type
  static String getScreenType(BuildContext context) {
    if (isDesktop(context)) return 'Desktop';
    if (isTablet(context)) return 'Tablet';
    return 'Mobile';
  }

  // Get safe area padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  // Get available height (excluding status bar and bottom navigation)
  static double getAvailableHeight(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return screenHeight - padding.top - padding.bottom;
  }

  // Get available width (excluding safe area)
  static double getAvailableWidth(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return screenWidth - padding.left - padding.right;
  }

  // Get aspect ratio
  static double getAspectRatio(BuildContext context) {
    return screenWidth / screenHeight;
  }

  // Check if device is in landscape mode
  static bool isLandscape(BuildContext context) {
    return orientation == Orientation.landscape;
  }

  // Get status bar height
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  // Get bottom navigation bar height
  static double getBottomNavigationBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
}
