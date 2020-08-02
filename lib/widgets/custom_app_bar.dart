import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:vibecheck/screen/settings/settings_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    this.appBar,
    this.comingFromIndex,
    this.needBackOption = false,
  }) : super(key: key);

  final AppBar appBar;
  final int comingFromIndex;
  final bool needBackOption;

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: FlatButton(
        focusColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        splashColor: Colors.white30,
        onPressed: () {
          if (needBackOption) {
            Navigator.pop(context);
          }
        },
        child: Icon(
          needBackOption ? Feather.arrow_left : Feather.feather,
          color: Colors.white,
          size: 25,
        ),
      ),
      centerTitle: true,
      title: Text(
        'VIBE CHECK',
        style: TextStyle(
            fontSize: 15,
            fontFamily: 'poppins',
            color: Colors.white,
            letterSpacing: 10),
      ),
      actions: <Widget>[
        FlatButton(
          focusColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          splashColor: Colors.white30,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SettingsScreen(comingFromIndex),
              ),
            );
          },
          child: Icon(
            AntDesign.setting,
            size: 22,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
