import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  late String id;
  late String userId;
  late String content;
  late DateTime createdAt;

  Note({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
  });

  factory Note.fromMap(Map<String, dynamic> data, String id) {
    return Note(
      id: id,
      userId: data['userId'] ?? '',
      content: data['note'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'note': content,
      'createdAt': createdAt,
    };
  }
}
