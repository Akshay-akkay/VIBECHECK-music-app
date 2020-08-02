import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:vibecheck/providers/song_model.dart';
import 'package:vibecheck/screen/downloads/downloads_screen.dart';
import 'package:vibecheck/screen/favorites/favorites_screen.dart';
import 'package:vibecheck/screen/search/search_screen.dart';
import 'package:vibecheck/widgets/big_page_title.dart';
import 'package:vibecheck/widgets/custom_app_bar.dart';
import 'package:vibecheck/widgets/custom_nav_bar.dart';
import 'package:vibecheck/widgets/vert_listview.dart';

class AllSongsScreen extends StatefulWidget {
  static const routeName = '/all-songs';

  @override
  _AllSongsScreenState createState() => _AllSongsScreenState();
}

class _AllSongsScreenState extends State<AllSongsScreen> {
  @override
  Widget build(BuildContext context) {
    final musicData = Provider.of<Songs>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        needBackOption: true,
        appBar: AppBar(),
        comingFromIndex: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BigPageTitle(
            titleString: 'All Songs',
          ),
          VertListView(),
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
        defaultSelectedIndex: 0,
      ),
    );
  }
}
