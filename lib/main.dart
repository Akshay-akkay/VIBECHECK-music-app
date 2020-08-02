import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibecheck/providers/song_model.dart';
import 'package:vibecheck/screen/all_songs/all_songs_screen.dart';
import 'package:vibecheck/screen/downloads/downloads_screen.dart';
import 'package:vibecheck/screen/home/discover_screen.dart';
import 'package:vibecheck/screen/favorites/favorites_screen.dart';
import 'package:vibecheck/screen/music_player/music_player_screen.dart';
import 'package:vibecheck/screen/search/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Song(),
        ),
        ChangeNotifierProvider(
          create: (context) => Songs(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vibe Check',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(
            subtitle2: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white),
            overline: TextStyle(color: Colors.white),
            button: TextStyle(color: Colors.white38),
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            headline3: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white),
            headline5: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
          ),
        ),
        home: DiscoverScreen(),
        routes: {
          FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
          DownloadsScreen.routeName: (ctx) => DownloadsScreen(),
          AllSongsScreen.routeName: (ctx) => AllSongsScreen(),
          MusicPlayerScreen.routeName: (ctx) => MusicPlayerScreen(),
        },
      ),
    );
  }
}
