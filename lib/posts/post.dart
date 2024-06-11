import 'package:tiktok_clone/posts/user.dart';

class Post {
  final User user;
  final int numberOfLike;
  final int numberOfReplies;
  final String content;
  final List<String> imageUrl;
  final List<User> repliers;
  final int uploadDate;
  Post({
    required this.user,
    required this.numberOfLike,
    required this.numberOfReplies,
    required this.content,
    this.imageUrl = const [],
    this.repliers = const [],
    required this.uploadDate,
  });
}

final postLists = [
  Post(
      user: dummyUsers[0],
      content: 'Vine after seeing the Treads logo unveiled',
      imageUrl: ['assets/polite_cat.jpeg'],
      numberOfReplies: 36,
      numberOfLike: 391,
      repliers: [dummyUsers[2]],
      uploadDate: 2),
  Post(
      user: dummyUsers[1],
      numberOfLike: 36,
      numberOfReplies: 200,
      repliers: [dummyUsers[0], dummyUsers[2]],
      content: "Elon alone on Twitter right now...",
      uploadDate: 5),
  Post(
      user: dummyUsers[2],
      content: 'I dont know what im doing',
      numberOfReplies: 40,
      numberOfLike: 391,
      repliers: [dummyUsers[1]],
      uploadDate: 15)
];
