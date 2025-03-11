import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Adwaith_profolio/theme/app_theme.dart';
import 'package:Adwaith_profolio/utils/size_utils.dart';
import 'package:Adwaith_profolio/widgets/footer.dart';
import 'package:Adwaith_profolio/models/resume.dart';
import 'package:Adwaith_profolio/widgets/project_detail_dialog.dart';

class HomeDesktopContent extends StatelessWidget {
  final Resume resume;

  const HomeDesktopContent({
    super.key,
    required this.resume,
  });

  @override
  Widget build(BuildContext context) {
    // Lọc các project có showOnHome = true
    final featuredProjects =
        resume.projects.where((p) => p.showOnHome).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          _introductDesktopContent(),
          _featureWorksContent(context),
          _toolContent(),
          const Footer(),
        ],
      ),
    );
  }

  Container _featureWorksContent(
    BuildContext context,
  ) {
    // Lọc các project có showOnHome = true
    final featuredProjects =
        resume.projects.where((p) => p.showOnHome).toList();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: SizeUtils.safeBlockVertical * 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: AppTheme.lightTheme.textTheme.displayLarge,
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
        ],
      ),
    );
  }

  Container _toolContent() {
    return Container(
      width: SizeUtils.safeBlockHorizontal * 100,
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: SizeUtils.safeBlockVertical * 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' Tools and technologies I Use',
            style: AppTheme.lightTheme.textTheme.displayMedium,
          ),
          const SizedBox(height: 24),
          Text(
            'Using the latest tools and technologies, I create efficient, responsive, and well-optimized mobile and web applications that enhance user experience and performance.',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 2.5,
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
            width: 80,
            height: 80,
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
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 16,
                  ),
                ),
              ],
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
        showDialog(
          context: context,
          builder: (context) => ProjectDetailDialog(project: project),
        );
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
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      project.skills
                          .take(2)
                          .join(', '), // Hiển thị 2 skill đầu tiên
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      project.name,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      project.summary.first, // Lấy dòng đầu tiên của summary
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              ProjectDetailDialog(project: project),
                        );
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                      ),
                      icon: const Text(
                        'View case study',
                        style: TextStyle(color: Colors.white),
                      ),
                      label: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.asset(
                      project.thumbnail,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _introductDesktopContent() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.safeBlockHorizontal * 15,
          vertical: SizeUtils.safeBlockVertical * 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adwaith asok',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Mobile Developer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            "I bring ideas to life with Flutter, creating mobile apps that blend stunning design, smooth functionality, and seamless performance to captivate users and elevate experiences.",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: SizeUtils.safeBlockHorizontal * 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    'See projects',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: SizeUtils.safeBlockHorizontal * 40,
                  child: const Text(
                      'I design and build high-performance apps that don’t just meet technical needs—they create seamless, intuitive experiences that users remember.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
