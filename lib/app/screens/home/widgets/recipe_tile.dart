import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({Key? key, required this.recipeData}) : super(key: key);
  // ! Rating remaining
  final Map recipeData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/recipe', arguments: {
          'recipeData': recipeData,
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  recipeData['image'],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        recipeData['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.heart,
                        size: 16,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          recipeData['description'],
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.justify,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.star_border_rounded,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '4.4',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 25),
                      Icon(
                        Icons.watch_later_outlined,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${recipeData['time']} mins',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
