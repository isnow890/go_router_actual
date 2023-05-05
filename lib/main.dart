import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_acutal/screen/1_screen.dart';
import 'package:go_router_acutal/screen/2_screen.dart';
import 'package:go_router_acutal/screen/3_screen.dart';
import 'package:go_router_acutal/screen/error_screen.dart';
import 'package:go_router_acutal/screen/home_screen.dart';

void main() => runApp(_App());

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: '/',
  //에러 처리
  errorBuilder: (context, state) {
    return ErrorScreen(error: state.error.toString());
  },
  routes: <RouteBase>[
    GoRoute(
      //처음 시작되는 화면
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'one',
          builder: (BuildContext context, GoRouterState state) =>
              const OneScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'two',
              builder: (BuildContext context, GoRouterState state) =>
                  const TwoScreen(),
              routes: <RouteBase>[
//route -> /one/two/three
                GoRoute(
                  path: 'three',
//path가 너무 길어지면 이름을 지어줄 수 있음.
                  name: ThreeScreen.routeName,
                  builder: (BuildContext context, GoRouterState state) =>
                      const ThreeScreen(),
                ),
              ],
            ),
          ],
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
