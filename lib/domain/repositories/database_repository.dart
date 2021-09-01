import 'package:my_chef/domain/models/recipe.dart';

abstract class DatabaseRepository {
  void createDocument(
    String collectionRoute,
    String id,
    Map<String, dynamic> document,
  );
  void updateDocument(String route, Map<String, dynamic> map);
  // void retrieveCollection(String route);
  // void retrieveDoc(String route);
  Future<bool?> querieNewUser(uid);
  Future<bool?> validateUsername(String username);

  void uploadRecipe(Recipe recipe);

  Future<List?> read();
}
