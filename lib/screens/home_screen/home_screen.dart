import 'package:flutter/material.dart';
import 'package:Adwaith_profolio/models/resume.dart';
import 'package:Adwaith_profolio/screens/home_screen/widgets/home_desktop.content.dart';
import 'package:Adwaith_profolio/screens/home_screen/widgets/home_mobile.content.dart';
import 'package:Adwaith_profolio/services/resume_service.dart';
import '../../utils/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeFuture = ResumeService.getResume();

    return FutureBuilder<Resume>(
      future: resumeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${snapshot.error}'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => ResumeService.getResume(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final resume = snapshot.data!;
        return ResponsiveWidget(
          mobile: HomeMobileContent(resume: resume),
          desktop: HomeDesktopContent(resume: resume),
        );
      },
    );
  }
}

// Responsive Layout Helper
class ResponsiveLayout {
  // Devices smaller than 650px are considered mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  // Devices between 650px and 1100px are considered tablets
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  // Devices larger than 1100px are considered desktops
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}

// Responsive Widget for Layout Management
class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isDesktop(context)) {
      return desktop;
    } else if (ResponsiveLayout.isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}
