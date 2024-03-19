class Recipe {
  // コンストラクタ
  Recipe({
    required this.id,
    required this.user_id,
    // required this.figure,
    this.figure = '../../images/salad.png',
    required this.name,
    // required this.ingredients,
    // this.ingredients = const [],
    required this.description,
    required this.created_at,
    this.like_count = 0,
  });

  // プロパティ
  final String id;
  final String user_id;
  final String figure;
  final String name;
  // final String ingredients;
  // final List<String> ingredients;
  final String description;
  final DateTime created_at;
  final int like_count;

  // JSONからRecipeを生成するファクトリコンストラクタ
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      user_id: json['user_id'],
      figure: json['figure'],
      name: json['name'],
      // ingredients: json['ingredients'] as String,
      // ingredients: List<String>.from(json['ingredients'].map((ingredient) => ingredient['name'])), // List<String>を使ってList<String>に変換
      description: json['description'],
      created_at: DateTime.parse(json['created_at']),
    );
  }
}