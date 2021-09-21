import 'package:flutter/material.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';
import 'package:my_chef/domain/repositories/database_repository.dart';
import 'package:provider/provider.dart';

class CreateUser {
  // ! Dont know if this or create_recipe impl

  static void createUser({
    required BuildContext context,
    required String name,
    required String username,
    required int age,
    required String country,
  }) {
    final AuthRepository auth = context.read<AuthRepository>();
    final email = auth.currentUserEmail();
    final uid = auth.currentUserId();

    final DatabaseRepository firestore = context.read<DatabaseRepository>();

    Map<String, dynamic> document = {
      'uid': uid,
      'name': name,
      'username': username,
      'email': email,
      'age': age,
      'country': country,
    };

    firestore.createDocument('/users', username, document);
  }
}
