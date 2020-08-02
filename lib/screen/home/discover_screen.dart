import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:vibecheck/screen/all_songs/all_songs_screen.dart';
import 'package:vibecheck/screen/downloads/downloads_screen.dart';
import 'package:vibecheck/screen/favorites/favorites_screen.dart';
import 'package:vibecheck/screen/search/search_screen.dart';
import 'package:vibecheck/widgets/big_page_title.dart';
import 'package:vibecheck/widgets/custom_app_bar.dart';
import 'package:vibecheck/widgets/custom_nav_bar.dart';
import 'package:vibecheck/widgets/hori_listview.dart';
import 'package:vibecheck/widgets/vert_listview.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        appBar: AppBar(),
        comingFromIndex: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BigPageTitle(
            titleString: 'Discover',
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Featured Albums',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                FlatButton(
                  focusColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  splashColor: Colors.white30,
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            ),
          ),
          HoriListview(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Featured Tracks',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                FlatButton(
                  focusColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  splashColor: Colors.white30,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AllSongsScreen.routeName);
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            ),
          ),
          VertListView()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          AntDesign.home,
          AntDesign.hearto,
          Feather.search,
          Feather.download,
        ],
        onChange: (val) {
          if (val == 0) {}
          if (val == 1) {
            return Navigator.of(context)
                .pushReplacementNamed(FavoritesScreen.routeName);
          }
          if (val == 2) {
            return Navigator.of(context)
                .pushReplacementNamed(SearchScreen.routeName);
          }
          if (val == 3) {
            return Navigator.of(context)
                .pushReplacementNamed(DownloadsScreen.routeName);
          }
        },
        defaultSelectedIndex: 0,
      ),
    );
  }
}
