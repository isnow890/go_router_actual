import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_acutal/screen/home_screen.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  // Go Router 2
  GoRouter get _router => GoRouter(
    //처음 시작되는 화면
    initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            builder: (_, state) => HomeScreen(),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    // Go Router 1
    return MaterialApp.router(
      //라우트 정보를 전달
      routeInformationProvider: _router.routeInformationProvider,
      //URI String을 상태 및 Go Router에서 사용할 수 있는 형태로
      //변환해 주는 함수
      routeInformationParser: _router.routeInformationParser,
      //위에서 변경된 값으로
      //실제 어떤 라우트를 보여줄지 정하는 함수
      routerDelegate: _router.routerDelegate,
    );
  }
}
