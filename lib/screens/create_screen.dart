import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_chef/components/categories_chip.dart';
import 'package:my_chef/components/my_text_form_field.dart';
import 'package:my_chef/constants.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  String? choosenImagePath;
  final ImagePicker _picker = ImagePicker();

  void chooseImage() async {
    // Pick an image
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        choosenImagePath = file.path;
      });
    }
  }

  // ! Test
  Widget displayImage() {
    if (choosenImagePath == null) {
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
          File(choosenImagePath!),
          width: 60,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  // !
  int? time;
  String? ingredients;
  String? procedure;

  void createRecipe() {}

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: screenSize.height - 112,
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
                        callback: (int? value) {
                          setState(() {
                            time = value;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text('Categories', style: kCreateTextStyle),
            Row(
              children: [
                CategoriesChip(label: 'Food'),
                CategoriesChip(label: 'Drink')
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoriesChip(label: 'Italian'),
                  CategoriesChip(label: 'Mexican'),
                  CategoriesChip(label: 'American'),
                  CategoriesChip(label: 'French'),
                  CategoriesChip(label: 'Spanish'),
                ],
              ),
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
                  ingredients = value;
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
                  procedure = value;
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
                        if (time != null &&
                            ingredients != null &&
                            procedure != null &&
                            choosenImagePath != null) {
                          createRecipe();
                        }
                      },
                      child: Text('Create'),
                      style: kElevatedButtonStyles,
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
