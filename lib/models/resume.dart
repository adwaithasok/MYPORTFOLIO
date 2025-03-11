class Resume {
  final Personal personal;
  final String summary;
  final List<Education> education;
  final List<Experience> experience;
  final List<Project> projects;
  final Map<String, List<String>> skills;
  final List<Certification> certifications;

  Resume({
    required this.personal,
    required this.summary,
    required this.education,
    required this.experience,
    required this.projects,
    required this.skills,
    required this.certifications,
  });

  factory Resume.fromJson(Map<String, dynamic> json) {
    return Resume(
      personal: Personal.fromJson(json['personal']),
      summary: json['summary'],
      education: (json['education'] as List)
          .map((e) => Education.fromJson(e))
          .toList(),
      experience: (json['experience'] as List)
          .map((e) => Experience.fromJson(e))
          .toList(),
      projects:
          (json['projects'] as List).map((e) => Project.fromJson(e)).toList(),
      skills: Map<String, List<String>>.from(
        json['skills'].map(
          (key, value) => MapEntry(
            key,
            List<String>.from(value),
          ),
        ),
      ),
      certifications: (json['certifications'] as List)
          .map((e) => Certification.fromJson(e))
          .toList(),
    );
  }
}

// Các model phụ
class Personal {
  final String name;
  final String title;
  final String location;
  final String email;
  final String phone;
  final String image;
  final List<Social> social;

  Personal({
    required this.name,
    required this.title,
    required this.location,
    required this.email,
    required this.phone,
    required this.image,
    required this.social,
  });

  factory Personal.fromJson(Map<String, dynamic> json) {
    return Personal(
      name: json['name'],
      title: json['title'],
      location: json['location'],
      phone: json['phone'],
      email: json['email'],
      image: json['image'],
      social: (json['social'] as List).map((e) => Social.fromJson(e)).toList(),
    );
  }
}

class Social {
  final String name;
  final String url;
  final String icon;
  final bool isActive;

  Social({
    required this.name,
    required this.url,
    required this.icon,
    required this.isActive,
  });

  factory Social.fromJson(Map<String, dynamic> json) {
    return Social(
      name: json['name'],
      url: json['url'],
      icon: json['icon'],
      isActive: json['isActive'],
    );
  }
}

class Education {
  final String school;
  final String degree;
  final String period;
  List<String>? details;
  List<String>? summary;

  Education({
    required this.school,
    required this.degree,
    required this.period,
    this.details,
    this.summary,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      school: json['school'],
      degree: json['degree'],
      period: json['period'],
      details:
          json['details'] != null ? List<String>.from(json['details']) : null,
      summary:
          json['summary'] != null ? List<String>.from(json['summary']) : null,
    );
  }
}

class Experience {
  final String company;
  final String role;
  final String period;
  final List<String> skills;
  List<String>? details;
  List<String>? summary;

  Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.skills,
    this.details,
    this.summary,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      company: json['company'],
      role: json['role'],
      period: json['period'],
      skills: List<String>.from(json['skills']),
      details:
          json['details'] != null ? List<String>.from(json['details']) : null,
      summary:
          json['summary'] != null ? List<String>.from(json['summary']) : null,
    );
  }
}

class Feature {
  final String title;
  final String description;

  Feature({
    required this.title,
    required this.description,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      title: json['title'],
      description: json['description'],
    );
  }
}

class ProjectStats {
  final String developmentTime;
  final String teamSize;
  final String platform;
  final String status;

  ProjectStats({
    required this.developmentTime,
    required this.teamSize,
    required this.platform,
    required this.status,
  });

  factory ProjectStats.fromJson(Map<String, dynamic> json) {
    return ProjectStats(
      developmentTime: json['developmentTime'],
      teamSize: json['teamSize'],
      platform: json['platform'],
      status: json['status'],
    );
  }
}

class ProjectSection {
  final String title;
  final List<String> items;

  ProjectSection({
    required this.title,
    required this.items,
  });

  factory ProjectSection.fromJson(Map<String, dynamic> json) {
    return ProjectSection(
      title: json['title'],
      items: List<String>.from(json['items']),
    );
  }
}

class Project {
  final String name;
  final List<String> skills;
  final List<String> summary;
  final List<ProjectSection> details;
  final String link;
  final String thumbnail;
  final List<Feature> features;
  final ProjectStats? stats;
  final bool showOnHome;

  Project({
    required this.name,
    required this.skills,
    required this.summary,
    required this.details,
    required this.link,
    required this.thumbnail,
    this.features = const [],
    this.stats,
    this.showOnHome = false,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      skills: List<String>.from(json['skills']),
      summary: List<String>.from(json['summary']),
      details: (json['details'] as List)
          .map((section) => ProjectSection.fromJson(section))
          .toList(),
      link: json['link'],
      thumbnail: json['thumbnail'],
      features: json['features'] != null
          ? List<Feature>.from(json['features'].map((x) => Feature.fromJson(x)))
          : [],
      stats:
          json['stats'] != null ? ProjectStats.fromJson(json['stats']) : null,
      showOnHome: json['showOnHome'] ?? false,
    );
  }
}

class Certification {
  final String name;
  final String issuer;
  final String date;
  final String description;
  final String link;

  Certification({
    required this.name,
    required this.issuer,
    required this.date,
    required this.description,
    required this.link,
  });

  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      name: json['name'],
      issuer: json['issuer'],
      date: json['date'],
      description: json['description'],
      link: json['link'],
    );
  }
}

// Thêm các model khác tương tự... 