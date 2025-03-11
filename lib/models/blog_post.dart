class BlogPost {
  final String id;
  final BlogMetadata metadata;
  final BlogContent content;

  BlogPost({
    required this.id,
    required this.metadata,
    required this.content,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'],
      metadata: BlogMetadata.fromJson(json['metadata']),
      content: BlogContent.fromJson(json['content']),
    );
  }
}

class BlogMetadata {
  final String title;
  final String readTime;
  final String author;
  final DateTime publishDate;
  final String type;
  final List<String> tags;
  final String imagePath;

  BlogMetadata({
    required this.title,
    required this.readTime,
    required this.author,
    required this.publishDate,
    required this.type,
    required this.tags,
    required this.imagePath,
  });

  factory BlogMetadata.fromJson(Map<String, dynamic> json) {
    return BlogMetadata(
      title: json['title'],
      readTime: json['readTime'],
      author: json['author'],
      publishDate: DateTime.parse(json['publishDate']),
      type: json['type'],
      tags: List<String>.from(json['tags']),
      imagePath: json['imagePath'],
    );
  }
}

class BlogContent {
  final String description;
  final List<BlogSection> sections;

  BlogContent({
    required this.description,
    required this.sections,
  });

  factory BlogContent.fromJson(Map<String, dynamic> json) {
    return BlogContent(
      description: json['description'],
      sections: (json['sections'] as List)
          .map((section) => BlogSection.fromJson(section))
          .toList(),
    );
  }
}

class BlogSection {
  final String? h1;
  final String? h2;
  final String? h3;
  final String? p;
  final List<String>? list;
  final String? blockquote;
  final BlogCode? code;

  BlogSection({
    this.h1,
    this.h2,
    this.h3,
    this.p,
    this.list,
    this.blockquote,
    this.code,
  });

  factory BlogSection.fromJson(Map<String, dynamic> json) {
    return BlogSection(
      h1: json['h1'],
      h2: json['h2'],
      h3: json['h3'],
      p: json['p'],
      list: json['list'] != null ? List<String>.from(json['list']) : null,
      blockquote: json['blockquote'],
      code: json['code'] != null ? BlogCode.fromJson(json['code']) : null,
    );
  }
}

class BlogCode {
  final String? title;
  final String language;
  final String content;

  BlogCode({
    this.title,
    required this.language,
    required this.content,
  });

  factory BlogCode.fromJson(Map<String, dynamic> json) {
    return BlogCode(
      title: json['title'],
      language: json['language'],
      content: json['content'],
    );
  }
}
