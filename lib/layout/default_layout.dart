import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;

  const DefaultLayout({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final router = GoRouter.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: body,
      ),
      appBar: AppBar(
        title: Text(router.location),
      ),
    );
  }
}
