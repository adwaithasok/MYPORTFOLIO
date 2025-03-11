import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Adwaith_profolio/models/resume.dart';
import 'package:Adwaith_profolio/theme/app_theme.dart';
import 'package:Adwaith_profolio/widgets/footer.dart';
import 'package:Adwaith_profolio/widgets/project_detail_dialog.dart';
import 'package:Adwaith_profolio/widgets/project_detail_dialog_mobile.dart';

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
          _buildMobileIntro(),
          _buildMobileFeaturedWorks(context),
          _buildMobileTools(),
          const Footer(),
        ],
      ),
    );
  }

  Widget _buildMobileIntro() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
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
                    'Fresher Mobile Developer',
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
        height: 400,
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
        child: Expanded(
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  project.thumbnail,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Expanded(
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
                      // const SizedBox(height: 10),
                      // TextButton.icon(
                      //   onPressed: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) =>
                      //           ProjectDetailDialogMobile(project: project),
                      //     );
                      //   },
                      //   style: TextButton.styleFrom(
                      //     padding: EdgeInsets.all(2),
                      //     backgroundColor: Colors.black,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(0),
                      //     ),
                      //   ),
                      //   icon: const Text(
                      //     'View case study',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   label: const Icon(Icons.arrow_forward,
                      //       color: Colors.white),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

  Widget _buildMobileTools() {
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
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.2,
            children: [
              // Tools
              _buildToolCard(
                icon: 'assets/icons/flutter.png',
                name: 'Flutter & Dart',
                description:
                    'UI toolkit for building natively compiled applications',
              ),
              _buildToolCard(
                icon: 'assets/icons/firebase.png',
                name: 'Firebase',
                description: 'Backend services (FCM, Database, Social Login)',
              ),
              _buildToolCard(
                icon: 'assets/icons/android.png',
                name: 'Android Studio',
                description: 'Official IDE for Android development',
              ),
              _buildToolCard(
                icon: 'assets/icons/github.png',
                name: 'GitHub',
                description: 'Version control and code hosting platform',
              ),
              _buildToolCard(
                icon: 'assets/icons/git.png',
                name: 'Git',
                description: 'Distributed version control system',
              ),
              _buildToolCard(
                icon: 'assets/icons/figma.png',
                name: 'Figma',
                description: 'Collaborative UI/UX design tool',
              ),
              _buildToolCard(
                icon: 'assets/icons/vscode.png',
                name: 'VS Code',
                description: 'Lightweight code editor',
              ),
              _buildToolCard(
                icon: 'assets/icons/postman.png',
                name: 'Postman',
                description: 'API development and testing tool',
              ),
              _buildToolCard(
                icon: 'assets/icons/wordpress.png',
                name: 'WordPress',
                description: 'Content management system for websites',
              ),
              _buildToolCard(
                icon: 'assets/icons/chatgpt.png',
                name: 'ChatGPT',
                description: 'AI assistant for coding and content generation',
              ),
              _buildToolCard(
                icon: 'assets/icons/xcode.png',
                name: 'Xcode',
                description: 'IDE for macOS and iOS development',
              ),
              _buildToolCard(
                icon: 'assets/icons/payment.WEBP',
                name: 'Payment Integration',
                description: 'Online payment gateway solutions',
              ),
              _buildToolCard(
                icon: 'assets/icons/rest_api.png',
                name: 'REST API',
                description: 'Web service communication standard',
              ),
              _buildToolCard(
                icon: 'assets/icons/gmaps.png',
                name: 'Google Maps API',
                description: 'Mapping and location-based services',
              ),
              _buildToolCard(
                icon: 'assets/icons/androidsdk.WEBP',
                name: 'Android SDK',
                description: 'Development tools for Android apps',
              ),
              _buildToolCard(
                icon: 'assets/icons/deployment.WEBP',
                name: 'App Deployment',
                description:
                    'Publishing and distributing applications (IOS - Android)',
              ),

              // Languages
              _buildToolCard(
                icon: 'assets/icons/react.png',
                name: 'React',
                description: 'JavaScript library for building UIs',
              ),
              _buildToolCard(
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

  Widget _buildToolCard({
    required String icon,
    required String name,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Flexible(
                  child: Text(
                    description,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
