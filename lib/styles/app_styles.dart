import 'package:flutter/material.dart';

class AppStyles {
  static final Color primary = const Color.fromARGB(255, 1, 61, 139);
  static final Color secondary = const Color.fromARGB(255, 158, 158, 158);

  static final Padding headingPadding = Padding(padding: EdgeInsets.all(8));
  static final Padding padding = Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  );

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subheading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle label = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle error = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.red,
  );

  static final Widget tinySeparator = SizedBox(height: 4, width: 4);
  static final Widget smallSeparator = SizedBox(height: 8, width: 8);
  static final Widget mediumSeparator = SizedBox(height: 16, width: 16);
  static final Widget bigSeparator = SizedBox(height: 24, width: 24);
}
