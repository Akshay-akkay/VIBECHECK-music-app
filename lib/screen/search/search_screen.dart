import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:vibecheck/screen/downloads/downloads_screen.dart';
import 'package:vibecheck/screen/favorites/favorites_screen.dart';
import 'package:vibecheck/screen/search/actual_search_screen.dart';
import 'package:vibecheck/widgets/big_page_title.dart';
import 'package:vibecheck/widgets/custom_app_bar.dart';
import 'package:vibecheck/widgets/custom_nav_bar.dart';
import 'package:vibecheck/widgets/genre_grid.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        appBar: AppBar(),
        comingFromIndex: 2,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BigPageTitle(
            titleString: 'Search',
          ),
          SearchBarButton(),
          Expanded(
            child: GenreGrid(),
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
          if (val == 2) {}
          if (val == 3) {
            return Navigator.of(context)
                .pushReplacementNamed(DownloadsScreen.routeName);
          }
        },
        defaultSelectedIndex: 2,
      ),
    );
  }
}

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) {
            return ListenableProvider(
              create: (context) => animation,
              child: ActualSearchScreen(),
            );
          }),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white.withOpacity(.8),
        ),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search Song, Album or Genre',
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(
                width: 25,
              ),
              Icon(
                Feather.search,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
