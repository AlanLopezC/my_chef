import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    required this.image,
    required this.title,
    required this.author,
    required this.rating,
    required this.time,
    this.isLiked = false,
  });

  final String image;
  // ! Overflow title
  final String title;
  final String author;
  final String rating;
  final String time;
  final bool isLiked;

  Widget buildHeart() {
    if (isLiked)
      return FaIcon(
        FontAwesomeIcons.solidHeart,
        size: 18,
        color: Colors.red,
      );
    else
      return FaIcon(
        FontAwesomeIcons.heart,
        size: 18,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 180,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x1f000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1f000000),
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(10),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    buildHeart(),
                  ],
                ),
                Transform.translate(
                  offset: Offset(0, -3),
                  child: Text(
                    author,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Color(0xff555555),
                    ),
                  ),
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
                      rating,
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
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Color(0xffeeeeee), width: 2.0),
//         color: Colors.white38,
//         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white10,
//             blurRadius: 4,
//             spreadRadius: 2,
//             offset: Offset(0, 2),
//           ),
//         ],