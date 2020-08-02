import 'package:flutter/material.dart';
import 'package:vibecheck/providers/genre_data.dart';
import 'package:vibecheck/widgets/genre_grid_item.dart';

class GenreGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 5 / 1),
      itemBuilder: (context, index) => GenreGridItem(
        genreIndex: index,
      ),
      itemCount: getTotalGenreNo(),
      physics: BouncingScrollPhysics(),
    );
  }
}
