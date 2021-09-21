import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/home/widgets/chips_row.dart';
import 'package:my_chef/app/screens/home/widgets/recipe_card.dart';

class FeedView extends StatelessWidget {
  // ! const FeedView();
  final List<Widget> items = [
    RecipeCard(
      image: 'assets/images/beef.jpg',
      title: 'Bisteca al forno',
      author: 'Alan Lopez',
      rating: '4.4',
      time: '25 mins',
    ),
    RecipeCard(
      image: 'assets/images/churros.jpg',
      title: 'Churros',
      author: 'Mario Lopez',
      rating: '3.7',
      time: '12 mins',
      isLiked: true,
    ),
    RecipeCard(
      image: 'assets/images/chicken.jpg',
      title: 'Salted Chicken',
      author: 'Alex Briseño',
      rating: '1.4',
      time: '30 mins',
      isLiked: true,
    ),
  ];
  final List<Widget> items2 = [
    RecipeCard(
      image: 'assets/images/pasta.jpg',
      title: 'Pasta Bella',
      author: 'Alan Lopez',
      rating: '4.9',
      time: '18 mins',
      isLiked: true,
    ),
    RecipeCard(
      image: 'assets/images/hamburger.jpg',
      title: 'Hamburger',
      author: 'David Flores',
      rating: '4.2',
      time: '22 mins',
      isLiked: true,
    ),
    RecipeCard(
      image: 'assets/images/churros.jpg',
      title: 'Churros',
      author: 'Mario Lopez',
      rating: '3.7',
      time: '12 mins',
      isLiked: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Chef')),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recipes',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ChipsRow(
                chipsLabel: ['All', 'Food', 'Drink', 'Italian', 'Mexican'],
                defaultIndex: 0,
                callback: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: Offset(-2, 0),
                  child: Container(
                    height: 220,
                    child: Row(
                      children: items,
                    ),
                  ),
                ),
              ),
              Text(
                'Trending',
                style: TextStyle(fontSize: 24),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Transform.translate(
                  offset: Offset(-2, 0),
                  child: Container(
                    height: 220,
                    child: Row(
                      children: items2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Recomended',
                style: TextStyle(fontSize: 24),
              ),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}
