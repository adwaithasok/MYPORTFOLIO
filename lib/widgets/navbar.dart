import 'package:flutter/material.dart';
import 'package:Adwaith_profolio/utils/size_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/responsive_layout.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class TimeDisplay extends StatefulWidget {
  const TimeDisplay({super.key});

  @override
  State<TimeDisplay> createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  late Timer _timer;
  late TimeOfDay _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = TimeOfDay.now();
    // Cập nhật thời gian mỗi phút
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _currentTime = TimeOfDay.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentTime.format(context),
      style: const TextStyle(fontSize: 12),
    );
  }
}

class NavBar extends StatelessWidget {
  final String currentRoute;

  const NavBar({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? SizeUtils.safeBlockHorizontal * 15 : 20.0,
        vertical: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          const Text(
            'Adwaith asok',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Menu items for desktop
          if (isDesktop)
            Row(
              children: [
                _buildNavItem(context, 'Home', '/home',
                    isActive: currentRoute == '/home'),
                _buildNavItem(context, 'Resume', '/resume',
                    isActive: currentRoute == '/resume'),
                _buildNavItem(context, 'About me', '/about',
                    isActive: currentRoute == '/about'),
                // _buildNavItem(context, 'Blog', '/blog',
                //     isActive: currentRoute == '/blog'),
                _buildNavItem(context, 'Contact', '/contact',
                    isActive: currentRoute == '/contact'),
              ],
            ),

          // Right section
          Row(
            children: [
              if (isDesktop) ...[
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Bengaluru City in Karnataka',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    TimeDisplay(),
                  ],
                ),
                const SizedBox(width: 10),
              ],
              TextButton(
                onPressed: () {
                  _launchURL(
                      'https://drive.google.com/file/d/1ZENrn5RwhER_TFjE3ZoDsHgCXsAhOvsf/view');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Download CV'),
              ),
              // Hamburger menu for mobile
              if (!isDesktop) ...[
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildNavItem(
    BuildContext context,
    String text,
    String route, {
    bool isActive = false,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

// Thêm Drawer cho mobile menu
class MobileDrawer extends StatelessWidget {
  final String currentRoute;

  const MobileDrawer({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Adwaith asok',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Bengaluru City in Karnataka',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, 'Home', '/home', currentRoute),
          _buildDrawerItem(context, 'Resume', '/resume', currentRoute),
          _buildDrawerItem(context, 'About me', '/about', currentRoute),
          // _buildDrawerItem(context, 'Blog', '/blog', currentRoute),
          _buildDrawerItem(context, 'Contact', '/contact', currentRoute),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    String route,
    String currentRoute,
  ) {
    final isActive = currentRoute == route;

    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.black : Colors.grey,
          fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
      onTap: () {
        context.go(route);
        Navigator.pop(context); // Close drawer
      },
    );
  }
}
