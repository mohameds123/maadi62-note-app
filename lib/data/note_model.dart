class NoteModel {
  String? noteId;
  String headLine;
  String description;
  DateTime createdAt;
  String? imageUrl;

  NoteModel({
    this.noteId,
    required this.headLine,
    required this.description,
    required this.createdAt,
    this.imageUrl,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      noteId: json['noteId'],
      headLine: json['headLine'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'headLine': headLine,
      'description': description,
      'imageUrl': imageUrl ?? "",
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
