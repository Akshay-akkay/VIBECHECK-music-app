import 'package:flutter/material.dart';

class HoriListview extends StatelessWidget {
  const HoriListview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: 25,
        padding: EdgeInsets.only(left: 12, bottom: 0, top: 0, right: 0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          child: Row(
            children: <Widget>[
              FlatButton(
                focusColor: Colors.white,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                splashColor: Colors.white30,
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'images/pexels-photo-1435457.png',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
