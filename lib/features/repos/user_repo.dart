import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepository {
  //access
  final FirebaseFirestore _db = FirebaseFirestore.instance;
}

final userRepo = Provider((ref) => UserRepository());
