import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_chef/domain/services/storage_service.dart';

class FirebaseStorageImpl implements StorageService {
  @override
  Future<String?> uploadImage(
      String? author, String? title, XFile? image) async {
    if (image == null) return null;
    File file = File(image.path);
    // !Title con espacios
    try {
      await FirebaseStorage.instance
          .ref('images/recipes/$author-$title.png')
          .putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }

    return getDownloadUrl(author, title);
  }

  Future<String?> getDownloadUrl(String? author, String? title) async {
    String? imageUrl;
    try {
      imageUrl = await FirebaseStorage.instance
          .ref('images/recipes/$author-$title.png')
          .getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
    }
    return imageUrl;
  }

  Future<void> deleteFile(String route) async {
    // route = 'uploads/file-to-upload.png'
    Reference ref = FirebaseStorage.instance.ref(route);
    try {
      await ref.delete();
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
