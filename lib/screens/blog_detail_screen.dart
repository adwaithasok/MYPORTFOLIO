import 'package:flutter/material.dart';
import '../models/blog_post.dart';
import '../utils/size_utils.dart';
import '../utils/responsive_layout.dart';
import '../utils/blog_detail_utils.dart';

class BlogDetailScreen extends StatelessWidget {
  final BlogPost post;
  final ScrollController _scrollController = ScrollController();

  BlogDetailScreen({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeader(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: SizeUtils.safeBlockVertical * 5,
      ),
      child: Column(
        children: [
          // Featured Image
          // Image.asset(post.metadata.imagePath),

          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: BlogDetailUtils.headerPaddingVertical,
                ),
                child: Text(
                  post.metadata.type,
                  style: BlogDetailUtils.metaStyle,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                post.metadata.title,
                style: BlogDetailUtils.titleStyle,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.metadata.author,
                        style: BlogDetailUtils.authorStyle,
                      ),
                      Text(
                        '${BlogDetailUtils.formatDate(post.metadata.publishDate)} • ${post.metadata.readTime}',
                        style: BlogDetailUtils.dateStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isDesktop(context)
            ? SizeUtils.safeBlockHorizontal * 15
            : 24,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tags
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: post.metadata.tags.map((tag) {
              return Container(
                padding: BlogDetailUtils.tagPadding,
                decoration: BlogDetailUtils.tagDecoration,
                child: Text(
                  '#$tag',
                  style: BlogDetailUtils.metaStyle,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 40),

          // Description
          Text(
            post.content.description,
            style: BlogDetailUtils.paragraphStyle,
          ),
          const SizedBox(height: 40),

          // Content Sections
          ...post.content.sections.map((section) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (section.h1 != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: BlogDetailUtils.paragraphSpacing,
                    ),
                    child: Text(
                      section.h1!,
                      style: BlogDetailUtils.h1Style,
                    ),
                  ),
                if (section.h2 != null)
                  Text(
                    section.h2!,
                    style: BlogDetailUtils.h2Style,
                  ),
                if (section.h3 != null)
                  Text(
                    section.h3!,
                    style: BlogDetailUtils.h3Style,
                  ),
                if (section.p != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 24),
                    child: Text(
                      section.p!,
                      style: BlogDetailUtils.paragraphStyle,
                    ),
                  ),
                if (section.list != null)
                  ...section.list!.map((item) => Padding(
                        padding: BlogDetailUtils.listItemPadding,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              width: BlogDetailUtils.bulletSize,
                              height: BlogDetailUtils.bulletSize,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                                width: BlogDetailUtils.bulletSpacing),
                            Expanded(
                              child: Text(
                                item,
                                style: BlogDetailUtils.paragraphStyle,
                              ),
                            ),
                          ],
                        ),
                      )),
                if (section.code != null)
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: BlogDetailUtils.paragraphSpacing,
                    ),
                    decoration: BlogDetailUtils.codeBlockDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (section.code!.title != null)
                          Container(
                            padding: BlogDetailUtils.codeBlockPadding,
                            decoration: BlogDetailUtils.codeTitleDecoration,
                            child: Text(
                              section.code!.title!,
                              style: BlogDetailUtils.codeTitleStyle,
                            ),
                          ),
                        Container(
                          padding: BlogDetailUtils.codeBlockPadding,
                          child: SelectableText(
                            section.code!.content,
                            style: BlogDetailUtils.codeStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (section.blockquote != null)
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: BlogDetailUtils.paragraphSpacing),
                    padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
                    decoration: BlogDetailUtils.blockquoteDecoration,
                    child: Text(
                      section.blockquote!,
                      style: BlogDetailUtils.blockquoteStyle,
                    ),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
