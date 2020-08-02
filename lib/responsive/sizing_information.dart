import 'package:flutter/cupertino.dart';

class SizingInformation {
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return ' ScreenSize $screenSize LocalWidgetSize: $localWidgetSize';
  }
}
