import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Adwaith_profolio/models/resume.dart';
import 'package:Adwaith_profolio/theme/app_theme.dart';
import 'package:Adwaith_profolio/widgets/footer.dart';
import 'package:Adwaith_profolio/widgets/project_detail_dialog.dart';
import 'package:Adwaith_profolio/widgets/project_detail_dialog_mobile.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class HomeMobileContent extends StatelessWidget {
  final Resume resume;

  const HomeMobileContent({
    super.key,
    required this.resume,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMobileIntro(context),
          _buildMobileFeaturedWorks(context),
          _buildMobileTools(context),
          const Footer(),
        ],
      ),
    );
  }

  Widget _buildMobileIntro(context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Prevents Column from taking infinite height
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FutureBuilder(
                  future: precacheImage(
                    const AssetImage('assets/images/avatar.jpg'),
                    context,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Adwaith asok',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Software Developer',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "I bring ideas to life with Flutter, creating mobile apps that blend stunning design, smooth functionality, and seamless performance to captivate users and elevate experiences.",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text(
                'See projects',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedWorkCard({
    required Project project,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        // showDialog(
        //   context: context,
        //   builder: (context) => ProjectDetailDialog(project: project),
        // );
      },
      child: Container(
        // margin: EdgeInsets.only(right: 20),
        width: double.infinity,
        // height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: FutureBuilder(
                future: precacheImage(
                  AssetImage(project.thumbnail),
                  context,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Image.asset(
                      project.thumbnail,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.white,
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.skills.take(2).join(','),
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    project.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.summary.first, // Lấy dòng đầu tiên của summary

                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            ProjectDetailDialogMobile(project: project),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.black),
                      child: Text(
                        'View',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileFeaturedWorks(context) {
    final featuredProjects =
        resume.projects.where((p) => p.showOnHome).toList();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Works',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          ...featuredProjects.map((project) => Column(
                children: [
                  _buildFeaturedWorkCard(
                    project: project,
                    context: context,
                  ),
                  const SizedBox(height: 40),
                ],
              )),
          // const SizedBox(height: 24),
          // _buildMobileProjectCard(
          //   category: 'Mobile App, Flutter',
          //   title: 'Matrimony App Development',
          //   description:
          //       'A feature-rich matrimony application with responsive UI, seamless animations, real-time chat, and advanced search filters for personalized matchmaking.',
          //   imagePath: 'assets/images/matrimony_app.png',
          // ),
          // const SizedBox(height: 24),
          // _buildMobileProjectCard(
          //   category: 'Mobile App, Flutter',
          //   title: 'ECourse',
          //   description:
          //       'A course app that allows users to learn, practice programming languages and take exams.',
          //   imagePath: 'assets/images/project2.png',
          // ),
          // const SizedBox(height: 24),
          // _buildMobileProjectCard(
          //   category: 'Web App, Spring Boot',
          //   title: 'Pulse Music',
          //   description:
          //       'A music streaming platform that allows users to stream music and create playlists.',
          //   imagePath: 'assets/images/project3.png',
          // ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectCard({
    required String category,
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  icon: const Text(
                    'View case study',
                    style: TextStyle(color: Colors.white),
                  ),
                  label: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTools(context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tools I Use',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'I leverage modern development tools and frameworks to build robust, scalable applications that deliver exceptional user experiences.',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 25,
            crossAxisSpacing: 25,
            childAspectRatio: 1.4,
            children: [
              // Tools
              _buildToolCard(
                context: context,
                icon: 'assets/icons/flutter.png',
                name: 'Flutter & Dart',
                description:
                    'UI toolkit for building natively compiled applications',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/firebase.png',
                name: 'Firebase',
                description: 'Backend services (FCM, Database, Social Login)',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/Android.png',
                name: 'Android Studio',
                description: 'Official IDE for Android development',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/github.png',
                name: 'GitHub',
                description: 'Version control and code hosting platform',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/git.png',
                name: 'Git',
                description: 'Distributed version control system',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/figma.png',
                name: 'Figma',
                description: 'Collaborative UI/UX design tool',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/vscode.png',
                name: 'VS Code',
                description: 'Lightweight code editor',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/postman.png',
                name: 'Postman',
                description: 'API development and testing tool',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/wordpress.png',
                name: 'WordPress',
                description: 'Content management system for websites',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/chatgpt.png',
                name: 'ChatGPT',
                description: 'AI assistant for coding and content generation',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/xcode.png',
                name: 'Xcode',
                description: 'IDE for macOS and iOS development',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/payment.WEBP',
                name: 'Payment Integration',
                description: 'Online payment gateway solutions',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/rest_api.png',
                name: 'REST API',
                description: 'Web service communication standard',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/gmaps.png',
                name: 'Google Maps API',
                description: 'Mapping and location-based services',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/androidsdk.webp',
                name: 'Android SDK',
                description: 'Development tools for Android apps',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/deployment.webp',
                name: 'App Deployment',
                description:
                    'Publishing and distributing applications (IOS - Android)',
              ),

              // Languages
              _buildToolCard(
                context: context,
                icon: 'assets/icons/react.png',
                name: 'React',
                description: 'JavaScript library for building UIs',
              ),
              _buildToolCard(
                context: context,
                icon: 'assets/icons/html.png',
                name: 'HTML, CSS & JS',
                description: 'Web development technologies',
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showToolDetails(
      BuildContext context, String icon, String name, String description) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(icon, width: 30, height: 30),
                const SizedBox(width: 10),
                Text(
                  name,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard({
    required String icon,
    required String name,
    required String description,
    context,
  }) {
    return GestureDetector(
      onTap: () => _showToolDetails(context, icon, name, description),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  icon,
                  width: 15,
                  height: 15,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    name,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      description,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2, // Prevents overflow
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
