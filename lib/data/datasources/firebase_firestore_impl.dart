import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chef/domain/models/recipe.dart';
import 'package:my_chef/domain/repositories/database_repository.dart';

class FirebaseFirestoreImpl implements DatabaseRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  void createDocument(
      String collectionRoute, String id, Map<String, dynamic> document) {
    DocumentReference ref = _firestore.collection(collectionRoute).doc(id);
    ref.set(document);
  }

  @override
  void updateDocument(String docRoute, Map<String, dynamic> map) {
    DocumentReference ref = _firestore.doc(docRoute);
    ref.update(map);
  }

  // @override
  // void retrieveCollection(String route) {
  //   // *Gives all docs from collection
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       print(doc["first_name"]);
  //     });
  //   });

  // }

  // @override
  // void retrieveDoc(String route) {
  //   FirebaseFirestore.instance
  //       .doc(route)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       print('Document exists on the database');
  //     } else{

  //     }
  //   });
  // }

  @override
  Future<bool?> querieNewUser(uid) async {
    QuerySnapshot querySnapshot;
    querySnapshot =
        await _firestore.collection('users').where('uid', isEqualTo: uid).get();

    return querySnapshot.docs.isEmpty;
  }

  //? Example
  Future<List?> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await _firestore
          .collection('users')
          .where("name", isEqualTo: "Alan Lopez")
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          // Map a = {"name": doc['name']};
          docs.add(doc.data());
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<bool?> validateUsername(String username) async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await _firestore.collection('users').doc(username).get();
      return !documentSnapshot.exists;
    } catch (e) {
      print(e);
    }
  }

  @override
  void uploadRecipe(Recipe recipe) {
    final String collectionRoute = "recipes";
    final String id = recipe.author + "-" + recipe.title;
    final Map<String, dynamic> document = {
      "author": recipe.author,
      "time": recipe.time,
      "ingredients": recipe.ingredients,
      "procedure": recipe.procedure,
      "title": recipe.title,
      "description": recipe.description,
      "image": recipe.image,
      "categories": recipe.categories,
      "recipeID": id,
      'timestamp': FieldValue.serverTimestamp(),
    };
    createDocument(collectionRoute, id, document);
  }

  @override
  Future<List?> retrieveRecipes(String? email) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await _firestore
          .collection('recipes')
          .where("author", isEqualTo: email)
          .orderBy('timestamp')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          // Map a = {"name": doc['name']};
          docs.add(doc.data());
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }
}
