import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/home/profile/widgets/middle_nav_bar.dart';

class RecipeView extends StatelessWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/beef.jpg',
            height: screenSize.height / 3,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Text(
            'Bisteca al forno',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          MiddleNavBar(titles: ['Ingredients', 'Proccedure']),
          Container(
            padding: EdgeInsets.all(50),
            height: screenSize.height * .47,
            decoration: BoxDecoration(
              color: Color(0xffa4ecc2),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity),
                Text('- yes'),
                Text('- yes'),
                Text('- yes'),
                Text('- yes'),
                Text('- yes'),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
