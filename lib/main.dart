import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_acutal/screen/1_screen.dart';
import 'package:go_router_acutal/screen/home_screen.dart';

void main() => runApp(_App());

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      //처음 시작되는 화면
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'one',
          builder: (BuildContext context, GoRouterState state) {return const OneScreen();
          },
        ),
      ],
    ),
  ],
);

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Go Router 1
    return MaterialApp.router(
      routerConfig: _router,

    );
  }
}
