class Recipe {
  Recipe({
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.time,
  });

  final String image;
  final String title;
  final String description;
  final String rating;
  final String time;
  bool _isLiked = false;

  void toggleLike() {
    _isLiked = !_isLiked;
  }
}
