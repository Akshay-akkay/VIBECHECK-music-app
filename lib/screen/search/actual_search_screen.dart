import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:vibecheck/anims/sliding_body.dart';
import 'package:vibecheck/providers/song_model.dart';

class ActualSearchScreen extends StatelessWidget {
  final Animation<double> transitionAnimation;

  ActualSearchScreen({
    this.transitionAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final musicData = Provider.of<Songs>(context);

    return Scaffold(
      body: SlidingBody(
        animation: Provider.of<Animation<double>>(context, listen: false),
        curve: Curves.easeInOutCubic,
        initialOffsetX: 0,
        initialOffsetY: 0.2,
        child: FloatingSearchBar.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(
                Feather.music,
                color: Colors.white,
              ),
              title: Text(
                musicData.getSongTitle(index),
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                  icon: Icon(
                    Feather.x,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            );
          },
          leading: IconButton(
            icon: Icon(Feather.arrow_left),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          trailing: Icon(Feather.search),
          onChanged: (String value) {},
          onTap: () {},
          decoration: InputDecoration.collapsed(
            hintText: "Search...",
          ),
        ),
      ),
    );
  }
}
