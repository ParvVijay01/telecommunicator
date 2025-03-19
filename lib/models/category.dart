class Category {
  final String id;
  final Map<String, dynamic> name;
  final Map<String, dynamic> description;
  final String? slug;
  final String? parentId;
  final String? parentName;
  final String? icon;
  final String status;

  Category({
    required this.id,
    required this.name,
    required this.description,
    this.slug,
    this.parentId,
    this.parentName,
    this.icon,
    required this.status,
  });

  // Getter to easily access the English name and description
  String get nameEn => name['en'] ?? 'No Name';
  String get descriptionEn => description['en'] ?? 'No Description';

  // Convert JSON to Category Object
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? {},  // Ensuring it's always a Map
      description: json['description'] ?? {},  // Ensuring it's always a Map
      slug: json['slug'],
      parentId: json['parentId'],
      parentName: json['parentName'],
      icon: json['icon'],
      status: json['status'] ?? 'hidden',
    );
  }

  // Convert Category Object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'slug': slug,
      'parentId': parentId,
      'parentName': parentName,
      'icon': icon,
      'status': status,
    };
  }
}
