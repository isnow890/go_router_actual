import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_acutal/model/user_model.dart';
import 'package:go_router_acutal/screen/login_screen.dart';

import '../screen/1_screen.dart';
import '../screen/2_screen.dart';
import '../screen/3_screen.dart';
import '../screen/error_screen.dart';
import '../screen/home_screen.dart';



//main.dart에서 사용하기 위한 용도의 Provider

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authStateProvider = AuthNotifier(ref: ref);

    return GoRouter(
      initialLocation: '/login',
      //에러 처리
      errorBuilder: (context, state) {
        return ErrorScreen(error: state.error.toString());
      },
      // redirect
      redirect: authStateProvider._redirectLogic,
      //refresh
      //상태가 바뀔때마다 redirect를 재실행해줌.
      //예를 들어 accesstoken이 만료가 되어서 로그아웃 되어야 하는데 route를 사용하지 않으면
      //redirection이 되지 않는 문제를 해결하기 위하여.

      refreshListenable: authStateProvider,
      routes: authStateProvider._routes,
    );
  },
);

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({required this.ref}) {
    ref.listen<UserModel?>(userProvider, (previous, next) {
      if (previous != next) {
        //재 빌드를 실행하라.
        notifyListeners();
      }
    }
    );
  }

  //GoRouterState
  String? _redirectLogic(_, GoRouterState state) {

    //UserModel의 인스턴스 또는 null
    final user = ref.read(userProvider);
    //로그인을 하려는 상태인지
    final loggingIn = state.location == '/login';

    //유저 정보가 없다 - 로그인한 상태가 아니다
    //유저 정보가 없고
    // 로그인하려는 중이 아니라면
    // 로그인 페이지로 이동한다.
    if (user == null){
      return loggingIn ? null : '/login';
    }

    //유저 정보가 있는데
    //로그인 페이지라면
    //홈으로 이동
    //비정상적인 경우임.
    if (loggingIn){
      return '/';
    }

    //나머지는 아무처리도 안함.
    return null;
  }

  List<GoRoute> get _routes => [
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
        GoRoute(
            path: '/login',
            builder: (BuildContext context, GoRouterState state) =>
                const LoginScreen()),
      ];
}

final userProvider = StateNotifierProvider<UserStateNotifier, UserModel?>(
    (ref) => UserStateNotifier());

//로그인한 상태면 UserModel 인스턴스 상태로 넣어주기
// 로그아웃 상태면 null 상태로 넣어주기
class UserStateNotifier extends StateNotifier<UserModel?> {
  UserStateNotifier() : super(null);

  login({required String name}) {
    state = UserModel(name: name);
  }

  logout() {
    state = null;
  }
}
