import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/home/profile/provider/mid_nav_bar.dart';
import 'package:my_chef/app/screens/home/widgets/recipe_tile.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';
import 'package:my_chef/domain/repositories/database_repository.dart';
import 'package:provider/provider.dart';

class MiddleNavBarDisplay extends StatelessWidget {
  const MiddleNavBarDisplay();

  Future<List?> retrieveRecipesData(BuildContext context) async {
    final _database = Provider.of<DatabaseRepository>(context);
    final _auth = Provider.of<AuthRepository>(context);

    final String? _email = _auth.currentUserEmail();

    return await _database.retrieveRecipes(_email);
  }

  @override
  Widget build(BuildContext context) {
    final MidNavBar midNavBar = Provider.of<MidNavBar>(context);

    if (midNavBar.getIndex() == 0) {
      return FutureBuilder(
        future: retrieveRecipesData(context),
        builder: (context, AsyncSnapshot<List?> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.lightBlueAccent,
              ),
            );
          }

          final recipesData = snapshot.data;
          late final List recipes;
          if (recipesData != null) {
            recipes = recipesData;
          }
          final List<Widget> recipeTiles = [];

          for (var recipe in recipes) {
            recipeTiles.add(
              RecipeTile(recipeData: recipe),
            );
          }

          return Column(children: recipeTiles);
        },
      );
    } else {
      return Center(
        child: Text('nothing yet'),
      );
    }
  }
}
