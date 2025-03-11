import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Adwaith_profolio/extensions/widget_extensions.dart';
import 'package:Adwaith_profolio/theme/app_theme.dart';
import 'package:Adwaith_profolio/utils/size_utils.dart';
import 'package:Adwaith_profolio/models/resume.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Adwaith_profolio/widgets/project_detail_dialog.dart';

class ResumeDesktopContent extends StatelessWidget {
  final Resume resume;

  const ResumeDesktopContent({
    super.key,
    required this.resume,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.safeBlockHorizontal * 15,
          vertical: SizeUtils.safeBlockVertical * 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                const SizedBox(height: 8),

                // Social links
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: resume.personal.social
                      .map((social) => _buildSocialLink(social))
                      .toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16),
                    const SizedBox(width: 8),
                    Text(resume.personal.location),
                    const SizedBox(width: 24),
                    const Icon(Icons.mail_outline, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      resume.personal.email,
                      style: GoogleFonts.spaceGrotesk(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.phone, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      resume.personal.phone,
                      style: GoogleFonts.spaceGrotesk(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Summary Section
                _buildSection(
                  'Summary',
                  [
                    _buildSummaryItem(resume.summary),
                  ],
                ),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 40),

                // Education Section
                _buildSection(
                  'Education',
                  resume.education
                      .map((edu) => _buildTimelineItem(
                            title: edu.school,
                            subtitle: edu.degree,
                            thumbnail: "",
                            period: edu.period,
                            summary: edu.summary,
                            context: context,
                          ))
                      .toList(),
                ),
              ],
            ),
            const Divider(color: Colors.grey, thickness: 1),
            const SizedBox(height: 40),

            // Experience Section
            _buildSection(
              'Experience',
              resume.experience
                  .map((exp) => _buildTimelineItem(
                        title: exp.company,
                        subtitle: exp.role,
                        thumbnail: "",
                        period: exp.period,
                        skills: exp.skills,
                        summary: exp.summary,
                        context: context,
                      ))
                  .toList(),
            ),
            const Divider(color: Colors.grey, thickness: 1),
            const SizedBox(height: 40),

            // Projects Section
            _buildSection(
              'My Projects',
              resume.projects
                  .map((project) => _buildTimelineItem(
                        title: project.name,
                        subtitle: '',
                        thumbnail: project.thumbnail,
                        period: '',
                        skills: project.skills,
                        details: project.details,
                        summary: project.summary,
                        link: project.link,
                        context: context,
                      ))
                  .toList(),
            ),
            const Divider(color: Colors.grey, thickness: 1),
            const SizedBox(height: 40),

            // Skills Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeUtils.safeBlockHorizontal * 10,
                  child: Text(
                    'Skills & Tools',
                    style: AppTheme.lightTheme.textTheme.titleLarge,
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: SizeUtils.safeBlockHorizontal * 60 - 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: resume.skills.entries
                        .map((entry) =>
                            _buildSkillsSection(entry.key, entry.value))
                        .toList(),
                  ),
                ),
              ],
            ),

            const Divider(color: Colors.grey, thickness: 1),
            const SizedBox(height: 40),

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
    return InkWell(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(social.url))) {
          await launchUrl(Uri.parse(social.url));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(social.icon, width: 16, height: 16),
            const SizedBox(width: 8),
            Text(
              social.name,
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeUtils.safeBlockHorizontal * 10,
          child: Text(
            title,
            style: AppTheme.lightTheme.textTheme.titleLarge,
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: SizeUtils.safeBlockHorizontal * 60 - 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          ),
        )
      ],
    );
  }

  Widget _buildSummaryItem(String title) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: SizeUtils.safeBlockHorizontal * 55,
      child: Text(title, style: AppTheme.lightTheme.textTheme.bodyLarge),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required String thumbnail,
    required String period,
    List<String>? summary,
    List<String>? skills,
    List<ProjectSection>? details,
    String? link,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTheme.lightTheme.textTheme.titleMedium,
                  ).addInkWell(() {
                    if (link != null) {
                      showDialog(
                        context: context,
                        builder: (context) => ProjectDetailDialog(
                          project: Project(
                            name: title,
                            skills: skills ?? [],
                            summary: summary ?? [],
                            details: details ?? [],
                            link: link ?? '',
                            thumbnail: thumbnail,
                          ),
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
            if (period.isNotEmpty)
              Text(
                period,
                style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
          ],
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
        ],
      ],
    );
  }

  Widget _buildSkillsSection(String title, List<String> skills) {
    return Column(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
        const SizedBox(height: 24),
      ],
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
