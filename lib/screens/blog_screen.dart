import 'package:flutter/material.dart';
import '../models/blog_post.dart';
import '../theme/app_theme.dart';
import '../utils/size_utils.dart';
import '../utils/responsive_layout.dart';
import '../services/blog_service.dart';
import 'package:go_router/go_router.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBlogPosts(),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogPosts() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Stories',
            style: AppTheme.lightTheme.textTheme.displayMedium,
          ),
          const SizedBox(height: 40),
          FutureBuilder<List<BlogPost>>(
            future: BlogService.getPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              final posts = snapshot.data ?? [];
              return ResponsiveWidget(
                mobile: _buildMobileGrid(posts, context),
                desktop: _buildDesktopGrid(posts, context),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopGrid(List<BlogPost> posts, BuildContext context) {
    // Bỏ qua bài viết đầu tiên (đã hiển thị ở header)
    final remainingPosts = posts.toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 1,
      ),
      itemCount: remainingPosts.length,
      itemBuilder: (context, index) {
        final post = remainingPosts[index];
        return _buildBlogCard(post, context);
      },
    );
  }

  Widget _buildMobileGrid(List<BlogPost> posts, BuildContext context) {
    // Bỏ qua bài viết đầu tiên (đã hiển thị ở header)
    final remainingPosts = posts.toList();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: remainingPosts.length,
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      itemBuilder: (context, index) {
        final post = remainingPosts[index];
        return _buildBlogCard(post, context);
      },
    );
  }

  Widget _buildBlogCard(BlogPost post, BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/blog/${post.id}', extra: post),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(post.metadata.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${post.metadata.publishDate.toString().split(' ')[0]} • ${post.metadata.type}',
            style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            post.content.description,
            style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Text(
            'READ MORE →',
            style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
