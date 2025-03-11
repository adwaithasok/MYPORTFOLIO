import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/size_utils.dart';
import '../utils/responsive_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          mobile: _buildMobileContent(),
          desktop: _buildDesktopContent(),
        ),
      ),
    );
  }

  Widget _buildDesktopContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildFeaturedWork(),
      ],
    );
  }

  Widget _buildMobileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMobileHeader(),
        _buildMobileFeaturedWork(),
      ],
    );
  }

  Widget _buildMobileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            "I'm Adwaith Asok, a passionate Flutter Developer dedicated to building high-performance, user-friendly mobile apps. My journey into app development started with a deep curiosity, and Flutter quickly became my go-to framework for its flexibility and efficiency. I specialize in creating scalable and intuitive applications while staying up-to-date with the latest trends in mobile development.\n\nBeyond coding, I love photography, biking, and traveling. Exploring new places and capturing moments through my lens fuels my creativity and enhances my problem-solving skills. Looking ahead, I'm excited to expand my expertise in Flutter and work on larger, more innovative projects.",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFeaturedWork() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore My Adventures',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 40),
          _buildMobileProjectCard(
            location: 'Bengaluru india',
            service: 'Motography',
            year: '2022-25',
            imagePaths: [
              'assets/images/adv1.jpg',
              'assets/images/adv2.jpg',
              'assets/images/adv3.WEBP',
              'assets/images/adv5.WEBP',
              'assets/images/adv6.WEBP',
              'assets/images/adv7.WEBP',
              'assets/images/adv8.jpg',
              'assets/images/adv9.WEBP',
              'assets/images/adv10.WEBP',
              'assets/images/adv11.WEBP',
              'assets/images/adv12.WEBP',
            ],
          ),
          const SizedBox(height: 40),
          _buildMobileProjectCard(
            location: 'Bengaluru india',
            service: 'Office',
            year: '2022-25',
            imagePaths: [
              'assets/images/office.jpg',
              'assets/images/office1.jpg',
              'assets/images/office2.jpg',
              'assets/images/office3.jpg',
              'assets/images/office4.jpg',
            ],
          ),
          const SizedBox(height: 16),
          _buildMobileProjectCard(
            location: 'Bengaluru india',
            service: 'Friends',
            year: '2022-25',
            imagePaths: [
              'assets/images/roommates.jpg',
              'assets/images/roommates1.jpg',
              'assets/images/roommates2.jpg',
              'assets/images/roommates3.WEBP',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectCard({
    required List<String> imagePaths, // Now accepts multiple images
    required String location,
    required String service,
    required String year,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Carousel
        CarouselSlider(
          options: CarouselOptions(
            height: 250,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0, // Make images fit fully
          ),
          items: imagePaths.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 16),

        // Project Details Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProjectDetail('Location', location),
            _buildProjectDetail('Program', service),
            _buildProjectDetail('Year', year),
          ],
        ),
      ],
    );
  }

// Helper function to avoid repetition
  Widget _buildProjectDetail(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: AppTheme.lightTheme.textTheme.titleSmall,
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: SizeUtils.safeBlockVertical * 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
            style: AppTheme.lightTheme.textTheme.displayLarge,
          ),
          const SizedBox(height: 24),
          Text(
            'I\'m Adwaith asok, a Flutter Developer with a passion for creating high-performance, user-friendly mobile apps. My journey started with a fascination for app development, and Flutter quickly became my go-to framework for its flexibility and efficiency. I focus on building scalable and intuitive apps while staying up-to-date with the latest mobile development trends\n\nOutside of coding, I enjoy mountain climbing, tracking, and photography. These hobbies fuel my creativity, enhance my problem-solving skills, and help me approach challenges with a fresh perspective. Looking ahead, I\'m excited to expand my expertise in Flutter and work on larger, more innovative projects.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedWork() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore My Adventures',
            style: AppTheme.lightTheme.textTheme.displayMedium,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            location: 'Bengaluru india',
            service: 'Motography',
            year: '2022-25',
            imagePaths: [
              'assets/images/adv1.jpg',
              'assets/images/adv2.jpg',
              'assets/images/adv3.WEBP',
              'assets/images/adv5.WEBP',
              'assets/images/adv6.WEBP',
              'assets/images/adv7.WEBP',
              'assets/images/adv8.jpg',
              'assets/images/adv9.WEBP',
              'assets/images/adv10.WEBP',
              'assets/images/adv11.WEBP',
              'assets/images/adv12.WEBP',
            ],
          ),
          const SizedBox(height: 100),
          _buildProjectCard(
            location: 'Bengaluru india',
            service: 'Office',
            year: '2022-25',
            imagePaths: [
              'assets/images/office.jpg',
              'assets/images/office1.jpg',
              'assets/images/office2.jpg',
              'assets/images/office3.jpg',
              'assets/images/office4.jpg',
            ],
          ),
          const SizedBox(height: 16),
          _buildProjectCard(
            location: 'Bengaluru india',
            service: 'Friends',
            year: '2022-25',
            imagePaths: [
              'assets/images/roommates.jpg',
              'assets/images/roommates1.jpg',
              'assets/images/roommates2.jpg',
              'assets/images/roommates3.WEBP',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required String location,
    required String service,
    required String year,
    required List<String> imagePaths, // Now accepts multiple images
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Info

        CarouselSlider(
          options: CarouselOptions(
            // height: 700,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0, // Make images fit fully
          ),
          items: imagePaths.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  location,
                  style: AppTheme.lightTheme.textTheme.titleMedium,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Service',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  service,
                  style: AppTheme.lightTheme.textTheme.titleMedium,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Year',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  year,
                  style: AppTheme.lightTheme.textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
