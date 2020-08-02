import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / _iconList.length,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width / _iconList.length - 8,
              decoration: index == _selectedIndex
                  ? BoxDecoration(
                      // border: Border(
                      //   bottom: BorderSide(width: 4, color: Color(0xffEE0979)),
                      // ),
                      gradient: LinearGradient(colors: [
                      Color(0xffEE0979).withOpacity(0.3),
                      Color(0xffFF6A00).withOpacity(0.005),
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                      // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                      )
                  : BoxDecoration(),
              child: Icon(
                icon,
                color: index == _selectedIndex ? Colors.white : Colors.grey,
              ),
            ),
          ),
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width / _iconList.length - 15,
            decoration: index == _selectedIndex
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(colors: [
                      Color(0xffEE0979),
                      Color(0xffFF6A00),
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight)
                    // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                    )
                : BoxDecoration(),
          ),
        ],
      ),
    );
  }
}
