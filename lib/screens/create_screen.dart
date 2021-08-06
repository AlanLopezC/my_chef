import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_chef/components/chips_row.dart';
import 'package:my_chef/components/my_text_form_field.dart';
import 'package:my_chef/constants.dart';
import 'package:my_chef/models/recipe.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  XFile? _image;

  void chooseImage() async {
    // Pick an image
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  // ! Test
  Widget displayImage() {
    if (_image == null) {
      return IconButton(
        onPressed: () => chooseImage(),
        icon: Icon(Icons.photo),
        splashRadius: 24,
        iconSize: 28,
      );
    } else {
      return GestureDetector(
        onTap: () => chooseImage(),
        child: Image.file(
          File(_image!.path),
          width: 60,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  // !
  int? _time;
  String? _ingredients;
  String? _procedure;
  String? _title;
  String? _description;

  List<String> _categories = ['Food', ''];
  final List<String> _categoriesList1 = ['Food', 'Drink'];
  final List<String> _categoriesList2 = [
    'Spanish',
    'French',
    'Italian',
    'Mexican',
    'Canadian'
  ];

  // var _isLiked;      no idea
  // var _author;       auth

  // var _avgRating;     firestore
  // var _allRatings;    // Firestore

  Future<void> createRecipe() async {
    // ? guessing correct format
    uploadImage('Jamie', _title);
    String? _imageUrl;
    try {
      _imageUrl = await FirebaseStorage.instance
          .ref('images/recipes/${'Jamie'}-$_title.png')
          .getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
    }

    Recipe recipe = Recipe(
      time: _time,
      ingredients: _ingredients,
      procedure: _procedure,
      title: _title,
      description: _description,
      image: _imageUrl,
      categories: _categories,
    );

    // ? Firestore
  }

  Future<void> uploadImage(String? author, String? title) async {
    if (_image == null) return;
    File file = File(_image!.path);
    try {
      await FirebaseStorage.instance
          .ref('images/recipes/$author-$title.png')
          .putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        // height: screenSize.height - 112,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Image',
                        style: kCreateTextStyle,
                      ),
                      displayImage(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time',
                        style: kCreateTextStyle,
                      ),
                      SizedBox(height: 18),
                      MyTextFormField(
                        placeholder: '25 (minutes)',
                        callback: (String value) {
                          setState(() {
                            _time = int.parse(value);
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text('Categories', style: kCreateTextStyle),
            ChipsRow(
              defaultIndex: 0,
              chipsLabel: _categoriesList1,
              callback: (int i) {
                setState(() {
                  _categories[0] = _categoriesList1[i];
                });
              },
            ),
            ChipsRow(
              chipsLabel: _categoriesList2,
              callback: (int i) {
                setState(() {
                  _categories[1] = _categoriesList2[i];
                });
              },
            ),
            Text(
              'Ingredients',
              style: kCreateTextStyle,
            ),
            MyTextFormField(
              placeholder: 'Ingredients',
              maxlines: 4,
              callback: (String? value) {
                setState(() {
                  _ingredients = value;
                });
              },
            ),
            Text(
              'Procedure',
              style: kCreateTextStyle,
            ),
            MyTextFormField(
              placeholder: 'Procedure',
              maxlines: 4,
              callback: (String? value) {
                setState(() {
                  _procedure = value;
                });
              },
            ),
            Text(
              'Title',
              style: kCreateTextStyle,
            ),
            MyTextFormField(
              placeholder: 'Title',
              callback: (String? value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            Text(
              'Description',
              style: kCreateTextStyle,
            ),
            MyTextFormField(
              placeholder: 'Description',
              callback: (String? value) {
                setState(() {
                  _description = value;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        // * Display error on screen
                        if (_image != null &&
                            _time != null &&
                            _ingredients != null &&
                            _title != null &&
                            _description != null &&
                            _procedure != null) {
                          // Check if author != null
                          createRecipe();
                        }
                      },
                      child: Text('Create'),
                      style: kElevatedButtonStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
