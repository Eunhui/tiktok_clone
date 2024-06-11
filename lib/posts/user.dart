class User {
  final String? profileImagePath;
  final String username;
  final bool verified;
  User({
    this.profileImagePath,
    required this.username,
    required this.verified,
  });
}

final dummyUsers = [
  User(
      profileImagePath: 'assets/thread_avatar_1.jpg',
      username: 'publity',
      verified: true),
  User(
      profileImagePath: 'assets/thread_avatar_2.jpg',
      username: 'thetinderblog',
      verified: true),
  User(
      profileImagePath: 'assets/thread_avatar_3.jpg',
      username: 'tropicalseductions',
      verified: true)
];
