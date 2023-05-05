import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;

  const DefaultLayout({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: body,
      ),
      appBar: AppBar(
        title: Text('Test'),
      ),
    );
  }
}
