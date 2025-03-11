import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TableOfContents extends StatelessWidget {
  final String content;
  final Function(String) onHeadingTap;

  const TableOfContents({
    super.key,
    required this.content,
    required this.onHeadingTap,
  });

  @override
  Widget build(BuildContext context) {
    final headings = _extractHeadings(content);

    return Container(
      width: 250,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Table of Contents',
            style: AppTheme.lightTheme.textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: headings.length,
              itemBuilder: (context, index) {
                final heading = headings[index];
                return _buildHeadingItem(heading);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadingItem(HeadingItem heading) {
    return Padding(
      padding: EdgeInsets.only(
        left: heading.level * 16.0,
        bottom: 12,
      ),
      child: InkWell(
        onTap: () => onHeadingTap(heading.text),
        child: Text(
          heading.text,
          style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[700],
            fontWeight:
                heading.level == 1 ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  List<HeadingItem> _extractHeadings(String content) {
    final headings = <HeadingItem>[];
    final lines = content.split('\n');

    for (final line in lines) {
      if (line.startsWith('#')) {
        final level = line.indexOf(' ');
        if (level > 0) {
          final text = line.substring(level + 1);
          headings.add(HeadingItem(text, level));
        }
      }
    }

    return headings;
  }
}

class HeadingItem {
  final String text;
  final int level;

  HeadingItem(this.text, this.level);
}
