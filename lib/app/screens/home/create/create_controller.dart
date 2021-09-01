import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_chef/app/screens/home/create/create_view.dart';
import 'package:my_chef/domain/usecases/create_recipe.dart';

class CreateController extends StatefulWidget {
  const CreateController({Key? key}) : super(key: key);

  @override
  _CreateControllerState createState() => _CreateControllerState();
}

class _CreateControllerState extends State<CreateController> {
  int? _time;
  String? _ingredients;
  String? _procedure;
  String? _title;
  String? _description;
  XFile? _image;

  final List<String> _selectedCategories = ['Food', ''];
  final List<String> _categoriesList1 = ['Food', 'Drink'];
  final List<String> _categoriesList2 = [
    'Spanish',
    'French',
    'Italian',
    'Mexican',
    'Canadian',
  ];

  void updateTime(String value) => _time = int.parse(value);
  void updateIngredients(String value) => _ingredients = value;
  void updateProcedure(String value) => _procedure = value;
  void updateTitle(String value) => _title = value;
  void updateDescription(String value) => _description = value;

  void updateSelectedCategories(int list, int index) {
    if (list == 0) {
      _selectedCategories[0] = _categoriesList1[index];
    } else if (list == 1) {
      _selectedCategories[1] = _categoriesList2[index];
    }
  }

  void onPressedButton() {
    // * Display error on screen
    if (_image != null &&
        _time != null &&
        _ingredients != null &&
        _title != null &&
        _description != null &&
        _procedure != null) {
      // Check if author != null

      CreateRecipe.createRecipe(
        image: _image,
        title: _title ?? "",
        description: _description ?? "",
        time: _time ?? 0,
        ingredients: _ingredients ?? "",
        procedure: _procedure ?? "",
        categories: _selectedCategories,
        context: context,
      );
    }
  }

  // ? Is there a better way ?
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

  @override
  Widget build(BuildContext context) {
    return CreateView(
      updateTime: updateTime,
      updateIngredients: updateIngredients,
      updateProcedure: updateProcedure,
      updateTitle: updateTitle,
      updateDescription: updateDescription,
      onPressedButton: onPressedButton,
      categoriesList1: _categoriesList1,
      categoriesList2: _categoriesList2,
      updateSelectedCategories: updateSelectedCategories,
      displayImage: displayImage,
    );
  }
}
