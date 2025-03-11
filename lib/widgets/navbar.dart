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
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() => _currentTime = TimeOfDay.now());
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

  const NavBar({super.key, required this.currentRoute});

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
          const Text(
            'Adwaith Asok',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          if (isDesktop)
            Row(children: [
              _buildNavItem(context, 'Home', '/home',
                  isActive: currentRoute == '/home'),
              _buildNavItem(context, 'Resume', '/resume',
                  isActive: currentRoute == '/resume'),
              _buildNavItem(context, 'About me', '/about',
                  isActive: currentRoute == '/about'),
              _buildNavItem(context, 'Contact', '/contact',
                  isActive: currentRoute == '/contact'),
            ]),
          Row(children: [
            Builder(
              builder: (context) => TextButton(
                onPressed: () => _launchURL(
                    'https://drive.google.com/file/d/1ZENrn5RwhER_TFjE3ZoDsHgCXsAhOvsf/view'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Download CV'),
              ),
            ),
            if (!isDesktop)
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
          ]),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Could not launch URL.')),
      // );
    }
  }

  Widget _buildNavItem(BuildContext context, String text, String route,
      {bool isActive = false}) {
    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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

class MobileDrawer extends StatelessWidget {
  final String currentRoute;

  const MobileDrawer({super.key, required this.currentRoute});

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
                  'Adwaith Asok',
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
          _buildDrawerItem(context, 'Contact', '/contact', currentRoute),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, String route, String currentRoute) {
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
        Navigator.pop(context);
      },
    );
  }
}
