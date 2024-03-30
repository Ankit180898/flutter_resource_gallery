class ResourceModel {
  final int id;
  final String title;
  final String content;
  final String category;
  final String url;

  ResourceModel({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.url,
  });

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return ResourceModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
      'url': url,
    };
  }
}
