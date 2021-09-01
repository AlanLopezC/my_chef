import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/home/profile/provider/mid_nav_bar.dart';
import 'package:my_chef/app/screens/home/widgets/recipe_tile.dart';
import 'package:provider/provider.dart';

class MiddleNavBarDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MidNavBar midNavBar = Provider.of<MidNavBar>(context);
    if (midNavBar.getIndex() == 0) {
      return Container(
        child: Column(
          children: [
            // Builder(builder: (context) {
            //   return RecipeTile();
            // }),
            RecipeTile(),
            RecipeTile(),
            RecipeTile(),
            RecipeTile(),
            RecipeTile(),
            RecipeTile(),
            RecipeTile(),
            RecipeTile(),
          ],
        ),
      );
    } else {
      return Center(
        child: Text('nothing yet'),
      );
    }
  }
}
