import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/models/post.dart';

class PostViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> uploadPost(String content, String mood) async {
    if (content.isEmpty || mood.isEmpty) {
      return Future.error('Please fill out all fields');
    }

    try {
      User? user = _auth.currentUser;
      if (user == null) {
        return Future.error('User not authenticated');
      }

      Post post = Post(
        content: content,
        mood: mood,
        timestamp: DateTime.now(),
        userId: user.uid, // 현재 유저의 UID 추가
      );

      await FirebaseFirestore.instance.collection('posts').add(post.toMap());

      notifyListeners();
    } catch (e) {
      return Future.error('Failed to upload post: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
