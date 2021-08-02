import 'package:flutter/cupertino.dart';
import 'package:my_chef/models/recipe.dart';

class User {
  late int id;
  late String username;
  late String bio;
  late String email;
  late String password;
  late Image profileImage;
  late Image backgroundImage;
  late List<Recipe> myRecipes;
  late List likedRecipes;
}
