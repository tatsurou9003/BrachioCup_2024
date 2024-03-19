class User {
  // コンストラクタ
  User({
    required this.id,
    required this.username,
  });

  // プロパティ
  final int id;
  final String username;

  // JSONからUserを生成するファクトリコンストラクタ
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
    );
  }
}