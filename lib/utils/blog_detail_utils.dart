import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogDetailUtils {
  // Layout Constants
  static const double headerImageHeight = 600.0;
  static const double headerPaddingVertical = 40.0;
  static const double contentMaxWidth = 800.0;
  static const double contentPaddingVertical = 60.0;
  static const double sectionSpacing = 40.0;
  static const double paragraphSpacing = 24.0;

  // Typography Styles
  static final TextStyle h1Style = GoogleFonts.openSans(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: -0.5,
    color: Colors.black,
  );

  static final TextStyle h2Style = GoogleFonts.openSans(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: -0.5,
    color: Colors.black,
  );

  static final TextStyle h3Style = GoogleFonts.openSans(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: Colors.black,
  );

  static final TextStyle paragraphStyle = GoogleFonts.openSans(
    fontSize: 18,
    height: 1.8,
    color: Colors.grey[800],
  );

  static final TextStyle metaStyle = GoogleFonts.openSans(
    fontSize: 14,
    color: Colors.grey[600],
  );

  static final TextStyle titleStyle = GoogleFonts.openSans(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: -0.5,
    color: Colors.black,
  );

  static final TextStyle authorStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static final TextStyle dateStyle = GoogleFonts.openSans(
    fontSize: 14,
    color: Colors.grey[600],
  );

  // Code Block Styles
  static const codeBlockPadding = EdgeInsets.all(24.0);
  static const double codeBlockBorderRadius = 8.0;

  static final TextStyle codeTitleStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.grey[800],
  );

  static final TextStyle codeStyle = GoogleFonts.robotoMono(
    fontSize: 14,
    height: 1.5,
    color: const Color(0xFF2D3748),
  );

  static final BoxDecoration codeBlockDecoration = BoxDecoration(
    color: const Color(0xFFF7FAFC),
    borderRadius: BorderRadius.circular(codeBlockBorderRadius),
    border: Border.all(
      color: const Color(0xFFE2E8F0),
      width: 1,
    ),
  );

  static const BoxDecoration codeTitleDecoration = BoxDecoration(
    color: Color(0xFFEDF2F7),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(codeBlockBorderRadius),
      topRight: Radius.circular(codeBlockBorderRadius),
    ),
  );

  // Blockquote Styles
  static final TextStyle blockquoteStyle = GoogleFonts.openSans(
    fontSize: 18,
    height: 1.8,
    color: Colors.grey[600],
    fontStyle: FontStyle.italic,
  );

  // Decorations remain the same
  static final BoxDecoration blockquoteDecoration = BoxDecoration(
    border: Border(
      left: BorderSide(
        color: Colors.grey[300]!,
        width: 4,
      ),
    ),
  );

  static final BoxDecoration tagDecoration = BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.circular(4),
  );

  // Paddings and other constants remain the same
  static const EdgeInsets tagPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 6,
  );

  static const double bulletSize = 6.0;
  static const double bulletSpacing = 16.0;
  static const EdgeInsets listItemPadding = EdgeInsets.only(
    left: 16,
    top: 8,
    bottom: 8,
  );

  // Content Types with colors
  static const Map<String, Color> typeColors = {
    'ARTICLE': Color(0xFF2196F3),
    'TUTORIAL': Color(0xFF4CAF50),
    'NEWS': Color(0xFFFFC107),
    'GUIDE': Color(0xFF9C27B0),
  };

  // Helper Methods
  static Color getTypeColor(String type) {
    return typeColors[type] ?? Colors.grey;
  }

  static String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  static String estimateReadTime(String content) {
    final wordCount = content.split(' ').length;
    final minutes = (wordCount / 200).ceil();
    return '$minutes MIN READ';
  }
}
