import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Adwaith_profolio/models/blog_post.dart';
import 'package:Adwaith_profolio/screens/blog_screen.dart';
import 'package:Adwaith_profolio/screens/contact_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/resume_screen/resume_screen.dart';
import 'theme/app_theme.dart';
import 'widgets/navbar.dart';
import 'widgets/size_init.dart';
import 'screens/about_screen.dart';
import 'screens/blog_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Adwaith asok',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return SizeInit(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                NavBar(currentRoute: state.uri.path),
                Expanded(child: child),
              ],
            ),
            endDrawer: MobileDrawer(currentRoute: state.uri.path),
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/resume',
          builder: (context, state) => const ResumeScreen(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutScreen(),
        ),
        GoRoute(
          path: '/blog',
          builder: (context, state) => const BlogScreen(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/blog/:id',
      builder: (context, state) {
        final post = state.extra as BlogPost;
        return BlogDetailScreen(post: post);
      },
    ),
  ],
);
