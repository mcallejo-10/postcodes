import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postcodes/screens/search_screen.dart';
import 'package:postcodes/styles/app_styles.dart';

void main() {
  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  } else {
    debugPrint = (message, {wrapWidth}) {
      final lines = '$message'.split('\n').map((line) => '[Postcodes] $line');
      debugPrintThrottled(lines.join('\n'), wrapWidth: wrapWidth);
    };
  }
  runApp(const PostcodeApp());
}

class PostcodeApp extends StatelessWidget {
  const PostcodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          backgroundColor: AppStyles.primary,
          foregroundColor: AppStyles.secondary,
        ),
      ),
      home: const SearchScreen(),
    );
  }
}
