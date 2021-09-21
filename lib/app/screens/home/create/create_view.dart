import 'package:flutter/material.dart';
import 'package:my_chef/app/constants.dart';
import 'package:my_chef/app/screens/home/widgets/chips_row.dart';
import 'package:my_chef/app/screens/home/create/widgets/my_text_form_field.dart';

class CreateView extends StatelessWidget {
  const CreateView({
    required this.updateTime,
    required this.updateIngredients,
    required this.updateProcedure,
    required this.updateTitle,
    required this.updateDescription,
    this.categoriesList1 = const ['Food', 'Drink'],
    this.categoriesList2 = const [
      'Spanish',
      'French',
      'Italian',
      'Mexican',
      'Canadian',
    ],
    required this.updateSelectedCategories,
    required this.onPressedButton,
    required this.displayImage,
  });

  final Function updateTime;
  final Function updateIngredients;
  final Function updateProcedure;
  final Function updateTitle;
  final Function updateDescription;

  final List<String> categoriesList1;
  final List<String> categoriesList2;
  final Function updateSelectedCategories;

  final Function onPressedButton;
  final Function displayImage;

  // ! Clear text after create
  // ! raise alert message "its done"

  // var _isLiked;      firestore
  // var _author;       auth

  // var _avgRating;     firestore
  // var _allRatings;    // Firestore

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Chef')),
      ),
      body: SingleChildScrollView(
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
                          callback: (String value) => updateTime(value),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text('Categories', style: kCreateTextStyle),
              ChipsRow(
                defaultIndex: 0,
                chipsLabel: categoriesList1,
                callback: (int i) => updateSelectedCategories(0, i),
              ),

              // ! if not other category list
              ChipsRow(
                chipsLabel: categoriesList2,
                callback: (int i) => updateSelectedCategories(1, i),
              ),
              Text(
                'Ingredients',
                style: kCreateTextStyle,
              ),
              MyTextFormField(
                placeholder: 'Ingredients',
                maxlines: 4,
                callback: (String? value) => updateIngredients(value),
              ),
              Text(
                'Procedure',
                style: kCreateTextStyle,
              ),
              MyTextFormField(
                placeholder: 'Procedure',
                maxlines: 4,
                callback: (String? value) => updateProcedure(value),
              ),
              Text(
                'Title',
                style: kCreateTextStyle,
              ),
              MyTextFormField(
                placeholder: 'Title',
                callback: (String? value) => updateTitle(value),
              ),
              Text(
                'Description',
                style: kCreateTextStyle,
              ),
              MyTextFormField(
                placeholder: 'Description',
                callback: (String? value) => updateDescription(value),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () => onPressedButton(),
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
      ),
    );
  }
}
