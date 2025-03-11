import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Adwaith_profolio/models/resume.dart';
import 'package:Adwaith_profolio/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResumeMobileContent extends StatelessWidget {
  final Resume resume;
  const ResumeMobileContent({super.key, required this.resume});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(resume.personal.image),
                ),
                Text(
                  resume.personal.name,
                  style: AppTheme.lightTheme.textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  resume.personal.title,
                  style: AppTheme.lightTheme.textTheme.titleLarge,
                ),
                const SizedBox(height: 10),

                // Contact info and social links
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on_outlined, size: 16),
                        const SizedBox(width: 8),
                        Text(resume.personal.location),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.mail_outline, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          resume.personal.email,
                          style: GoogleFonts.spaceGrotesk(
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.phone, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          resume.personal.phone,
                          style: GoogleFonts.spaceGrotesk(
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: resume.personal.social
                      .map((social) => _buildSocialLink(social))
                      .toList(),
                ),

                const SizedBox(height: 16),

                // Education Section
                _buildSection(
                  'Sumary',
                  [
                    _buildSummaryItem(resume.summary),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(height: 15),
                _buildSection(
                  'Education',
                  resume.education
                      .map((edu) => _buildTimelineItem(
                            title: edu.school,
                            subtitle: edu.degree,
                            period: edu.period,
                          ))
                      .toList(),
                ),
              ],
            ),
            // Header with name and title
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(height: 16),

            // Experience Section
            _buildSection(
              'Experience',
              resume.experience
                  .map((exp) => _buildTimelineItem(
                        title: exp.company,
                        subtitle: exp.role,
                        period: exp.period,
                        skills: exp.skills,
                      ))
                  .toList(),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(height: 16),

            // Featured Project Section
            _buildSection(
              'My Projects',
              resume.projects
                  .map((project) => _buildTimelineItem(
                        title: project.name,
                        subtitle: '',
                        period: '',
                        skills: project.skills,
                        summary: project.summary,
                        details: project.details,
                        link: project.link,
                      ))
                  .toList(),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(height: 16),

            // Skills Section
            Text(
              'Skills & Tools',
              style: AppTheme.lightTheme.textTheme.titleLarge,
            ),
            const SizedBox(width: 16),
            ...resume.skills.entries
                .map((entry) => _buildSkillsSection(entry.key, entry.value)),

            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(height: 16),

            // Certifications Section
            _buildSection(
              'Certifications',
              resume.certifications
                  .map((cert) => _buildCertificationItem(cert))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLink(Social social) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(social.icon, width: 16, height: 16),
          const SizedBox(width: 8),
          InkWell(
            onTap: () async {
              if (await canLaunchUrl(Uri.parse(social.url))) {
                await launchUrl(Uri.parse(social.url));
              }
            },
            child: Text(
              social.name,
              style: const TextStyle(
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(
            title,
            style: AppTheme.lightTheme.textTheme.titleLarge,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
      ],
    );
  }

  Widget _buildSummaryItem(String title) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required String period,
    List<String>? skills,
    List<String>? summary,
    List<ProjectSection>? details,
    String? link,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppTheme.lightTheme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (period.isNotEmpty)
              Text(
                period,
                style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        if (subtitle.isNotEmpty)
          Text(
            subtitle,
            style: AppTheme.lightTheme.textTheme.bodyMedium,
          ),
        if (skills != null) ...[
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((skill) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        skill,
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                    ))
                .toList(),
          ),
        ],
        if (summary != null) ...[
          const SizedBox(height: 12),
          ...summary.map((entry) => Container(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 5, height: 5, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(entry)),
                  ],
                ),
              )),
        ],
        if (link != null) ...[
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(width: 5, height: 5, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () async {
                    if (await canLaunchUrl(Uri.parse(link))) {
                      await launchUrl(Uri.parse(link));
                    }
                  },
                  child: Text(
                    link,
                    style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ],
    );
  }

  Widget _buildSkillsSection(String title, List<String> skills) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.lightTheme.textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((skill) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        skill,
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationItem(Certification cert) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    cert.name,
                    style: AppTheme.lightTheme.textTheme.titleMedium,
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.verified, color: Colors.blue, size: 16),
                ],
              ),
              Text(
                cert.date,
                style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            cert.issuer,
            style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            cert.description,
            style: AppTheme.lightTheme.textTheme.bodyMedium,
          ),
          if (cert.link.isNotEmpty) ...[
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                if (await canLaunchUrl(Uri.parse(cert.link))) {
                  await launchUrl(Uri.parse(cert.link));
                }
              },
              child: Text(
                'View Certificate',
                style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
