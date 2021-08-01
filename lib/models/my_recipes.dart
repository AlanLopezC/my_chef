import 'package:my_chef/models/recipe.dart';

class MyRecipes {
  List<Recipe> _myRecipes = [];

  void addRecipe(Recipe recipe) {
    _myRecipes.add(recipe);
  }
}
