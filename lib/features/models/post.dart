import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String content;
  final String mood;
  final DateTime timestamp;
  final String userId; // 추가된 필드

  Post(
      {required this.content,
      required this.mood,
      required this.timestamp,
      required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'mood': mood,
      'timestamp': timestamp,
      'userId': userId, // 추가된 필드
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      content: map['content'],
      mood: map['mood'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      userId: map['userId'], // 추가된 필드
    );
  }
}
