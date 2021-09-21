class Recipe {
  Recipe({
    required this.image,
    required this.title,
    required this.description,
    required this.time,
    required this.categories,
    required this.ingredients,
    required this.procedure,
    required this.author,
  });

  final String image;
  final String title;
  final String description;
  final int time;
  final String ingredients;
  final String procedure;
  final List<String> categories;
  final String author;

  //!
  bool _isLiked = false;
  late String rating;

  // !
  void toggleLike() {
    _isLiked = !_isLiked;
  }
}
