class Recipe {
  final int id;
  final String title;
  final String description;
  final String ingredients;
  final String instructions;
  final String image;
  final String category;
  final DateTime created_at;
  final DateTime updated_at;
  final int user;

  Recipe(
      {required this.id,
      required this.title,
      required this.description,
      required this.ingredients,
      required this.instructions,
      required this.image,
      required this.category,
      required this.created_at,
      required this.updated_at,
      required this.user});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      ingredients: json['ingredients']?.toString() ?? '',
      instructions: json['instructions']?.toString() ?? '',
      image: (json['image']?.toString() ?? '')
          .replaceAll('http://minio:9000', 'http://192.168.70.107:9000'),
      category: json['category']?.toString() ?? '',
      created_at: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())?.toLocal() ??
              DateTime.now()
          : DateTime.now(),
      updated_at: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString())?.toLocal() ??
              DateTime.now()
          : DateTime.now(),
      user: json['user'] is int
          ? json['user']
          : int.tryParse(json['user'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'instructions': instructions,
      'image': image,
      'category': category,
      'created_at': created_at.toIso8601String(),
      'updated_at': updated_at.toIso8601String(),
      'user': user,
    };
  }
}
