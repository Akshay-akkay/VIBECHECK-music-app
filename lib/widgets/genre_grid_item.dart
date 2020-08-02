import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vibecheck/providers/genre_data.dart';

class GenreGridItem extends StatelessWidget {
  final int genreIndex;
  const GenreGridItem({Key key, this.genreIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      // padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              getGenreTitle(genreIndex),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: double.infinity,
              child: Image.network(
                getGenreImage(genreIndex),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Icon(Feather.chevron_down)
        ],
      ),
    );
  }
}
