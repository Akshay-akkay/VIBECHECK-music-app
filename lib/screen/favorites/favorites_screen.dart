import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:vibecheck/screen/downloads/downloads_screen.dart';
import 'package:vibecheck/screen/search/search_screen.dart';
import 'package:vibecheck/widgets/big_page_title.dart';
import 'package:vibecheck/widgets/custom_app_bar.dart';
import 'package:vibecheck/widgets/custom_nav_bar.dart';
import 'package:vibecheck/widgets/vert_listview.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites';

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  var isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        appBar: AppBar(),
        comingFromIndex: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BigPageTitle(
            titleString: 'Favorites',
          ),
          Container(
            margin: EdgeInsets.only(left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Your Favored Tracks',
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
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            ),
          ),
          VertListView(
            removeOption: isEditing,
          )
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
          if (val == 0) {
            return Navigator.of(context)..pushReplacementNamed('/');
          }
          if (val == 1) {}
          if (val == 2) {
            return Navigator.of(context)
                .pushReplacementNamed(SearchScreen.routeName);
          }
          if (val == 3) {
            return Navigator.of(context)
                .pushReplacementNamed(DownloadsScreen.routeName);
          }
        },
        defaultSelectedIndex: 1,
      ),
    );
  }
}
