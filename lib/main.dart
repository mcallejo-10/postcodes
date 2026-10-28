import 'package:flutter/material.dart';

void main() {
  runApp(const PostcodeApp());
}

class PostcodeApp extends StatelessWidget {
  const PostcodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
