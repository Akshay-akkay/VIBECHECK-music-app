import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:vibecheck/screen/downloads/downloads_screen.dart';
import 'package:vibecheck/screen/favorites/favorites_screen.dart';
import 'package:vibecheck/screen/search/search_screen.dart';
import 'package:vibecheck/widgets/big_page_title.dart';
import 'package:vibecheck/widgets/custom_app_bar.dart';
import 'package:vibecheck/widgets/custom_nav_bar.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  final int comingFromIndex;

  SettingsScreen(this.comingFromIndex);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        // comingFromIndex: widget.comingFromIndex,
        needBackOption: true,
        appBar: AppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BigPageTitle(
            titleString: 'Settings',
          ),
          ListTileShimmer(
            isDarkMode: true,
          ),
          ListTileShimmer(
            isDarkMode: true,
          ),
          ListTileShimmer(
            isDarkMode: true,
          ),
          ListTileShimmer(
            isDarkMode: true,
          ),
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
        defaultSelectedIndex: widget.comingFromIndex,
      ),
    );
  }
}
