import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/resume.dart';

class ResumeService {
  static Future<Resume> getResume() async {
    try {
      final String response =
          await rootBundle.loadString('assets/resume/resume.json');
      final data = json.decode(response);
      return Resume.fromJson(data);
    } catch (e) {
      print('Error loading resume: $e');
      rethrow;
    }
  }
}
