import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

var _image;

Future<void> uploadImage() async {
  if (_image == null) return;
  File file = File(_image!.path);
  try {
    await FirebaseStorage.instance
        .ref('uploads/file-to-upload.png')
        .putFile(file);
  } on FirebaseException catch (e) {
    print(e);
  }
}

Future<void> deleteFile() async {
  Reference ref = FirebaseStorage.instance.ref('uploads/file-to-upload.png');
  try {
    await ref.delete();
  } on FirebaseException catch (e) {
    print(e);
  }
}

// https://firebase.flutter.dev/docs/storage/usage
FirebaseStorage storage = FirebaseStorage.instance;
//? Reference to file
Reference ref = FirebaseStorage.instance.ref('/notes.txt');
  // .ref().child(notes.txt)
  // ? Download url
  // *String downloadURL = await FirebaseStorage.instance
  //  *   .ref('users/123/avatar.jpg')
  //   *  .getDownloadURL();
  // Image.network(downloadURL);
  // ? Upload
  // File file = File(filePath);
  //   try {
  //   await FirebaseStorage.instance
  //       .ref('uploads/file-to-upload.png')
  //       .putFile(file);
  // } on firebase_core.FirebaseException catch (e) {
  //    /e.g, e.code == 'canceled'
  // }