import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/blog_post.dart';

class BlogService {
  static Future<List<BlogPost>> getPosts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/blog/blog.json');
      final data = json.decode(response);
      return (data['posts'] as List)
          .map((post) => BlogPost.fromJson(post))
          .toList();
    } catch (e) {
      print('Error loading blog posts: $e');
      return [];
    }
  }
}
