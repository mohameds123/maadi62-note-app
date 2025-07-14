class NoteModel {
  final String headline;
  final String description;
  final DateTime createdAt;

  NoteModel({
    required this.headline,
    required this.description,
    required this.createdAt,
  });

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'headline': headline,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create object from JSON
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      headline: json['headline'] ?? '',
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
