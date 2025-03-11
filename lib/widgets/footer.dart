import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';
import '../utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _buildMobileFooter(),
      desktop: _buildDesktopFooter(),
    );
  }

  Widget _buildDesktopFooter() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: 48,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo và Mission
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Adwaith asok',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "My mission is to build innovative mobile apps that enhance everyday life, while fueling my passion for  the art and adrenaline of motography through my lens.",
                      style: TextStyle(
                        color: Colors.grey[400],
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 64),
              // About Links
              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       _buildFooterTitle('About'),
              //       _buildFooterLink('About Us'),
              //       _buildFooterLink('Blog'),
              //       _buildFooterLink('Career'),
              //     ],
              //   ),
              // ),
              // Support Links
              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       _buildFooterTitle('Support'),
              //       _buildFooterLink('Contact Us'),
              //       _buildFooterLink('Return'),
              //       _buildFooterLink('FAQ'),
              //     ],
              //   ),
              // ),
              // Get Updates Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterTitle('Get in tuch'),
                    const SizedBox(height: 16),
                    _buildEmailSubscribe(),
                    const SizedBox(height: 24),
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          // Bottom Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '©2024 Adwaith asok. All rights reserved.',
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),
              Row(
                children: [
                  // _buildFooterSmallLink('Privacy Policy'),
                  // const SizedBox(width: 24),
                  // _buildFooterSmallLink('Terms of Service'),
                ],
              ),
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

  Widget _buildMobileFooter() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo & Mission
          const Text(
            'Adwaith Asok',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Adventure redefined—where style meets function in every step of your journey.',
            style: TextStyle(
              color: Colors.grey[400],
              height: 1.6,
            ),
          ),

          const SizedBox(height: 16),

          _buildFooterTitle('Stay Connected'),
          // const SizedBox(height: 5),
          _buildEmailSubscribe(),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildSocialIcon('assets/icons/github.png', () {
                _launchURL('https://github.com/adwaithasok');
              }),
              _buildSocialIcon('assets/icons/linkedin.png', () {
                _launchURL('https://www.linkedin.com/in/adwaithasok/');
              }),
            ],
          ),
          const SizedBox(height: 32),

          // Bottom Section
          Text(
            '©2025 Adwaith Asok. All rights reserved.',
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
          const SizedBox(height: 12),
          // Row(
          //   children: [
          //     _buildFooterSmallLink('Privacy Policy'),
          //     const SizedBox(width: 24),
          //     _buildFooterSmallLink('Terms of Service'),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildFooterTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildFooterSmallLink(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: 12,
      ),
    );
  }

  Widget _buildEmailSubscribe() {
    TextEditingController emailController = TextEditingController();

    void _sendEmail() {
      final String email = emailController.text.trim();
      if (email.isNotEmpty) {
        final Uri emailUri = Uri(
          scheme: 'mailto',
          path: 'adwaithdeva@gmail.com',
          queryParameters: {
            'subject': 'New Connection',
            'body': 'Hello, my email is $email'
          },
        );
        launchUrl(emailUri);
      }
    }

    return Container(
      // height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter Details',
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              ),
            ),
          ),
          GestureDetector(
            onTap: _sendEmail,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue, // Adjust color if needed
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Connect',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String iconPath, ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(
          iconPath,
          width: 16,
          height: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
