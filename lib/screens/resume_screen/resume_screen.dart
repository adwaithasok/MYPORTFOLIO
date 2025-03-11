import 'package:flutter/material.dart';
import 'package:Adwaith_profolio/utils/responsive_layout.dart';
import 'widgets/resume_desktop.content.dart';
import 'widgets/resume_mobile.content.dart';
import 'package:Adwaith_profolio/services/resume_service.dart';
import 'package:Adwaith_profolio/models/resume.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Resume>(
      future: ResumeService.getResume(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final resume = snapshot.data!;
        return ResponsiveWidget(
          mobile: ResumeMobileContent(resume: resume),
          desktop: ResumeDesktopContent(resume: resume),
        );
      },
    );
  }
}
