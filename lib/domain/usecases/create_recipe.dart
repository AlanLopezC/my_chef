import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_chef/domain/models/recipe.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';
import 'package:my_chef/domain/repositories/database_repository.dart';
import 'package:my_chef/domain/services/storage_service.dart';
import 'package:provider/provider.dart';

class CreateRecipe {
  static Future<void> createRecipe({
    required XFile? image,
    required String title,
    required String description,
    required int time,
    required List<String> categories,
    required String ingredients,
    required String procedure,
    required BuildContext context,
  }) async {
    AuthRepository auth = context.read<AuthRepository>();
    final String? author = auth.currentUserEmail();

    StorageService storage = context.read<StorageService>();
    String? imageUrl = await storage.uploadImage(author, title, image);

    Recipe recipe = Recipe(
      time: time,
      ingredients: ingredients,
      procedure: procedure,
      title: title,
      description: description,
      image: imageUrl ?? "No url",
      categories: categories,
      author: author ?? "anonimous",
    );

    DatabaseRepository database = context.read<DatabaseRepository>();
    database.uploadRecipe(recipe);
  }
}
