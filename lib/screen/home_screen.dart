import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_acutal/layout/default_layout.dart';
import 'package:go_router_acutal/provider/auth_provider.dart';

import '3_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/one');
            },
            child: Text('Screen One (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/one/two');
            },
            child: Text('Screen Two (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              // context.go('/one/two/three');
              //main.dart에 이름 지어준 것을 사용.
              context.goNamed(ThreeScreen.routeName);
            },
            child: Text('Screen Three (GO)'),
          ),

          ElevatedButton(
            onPressed: () {
              // context.go('/one/two/three');
              //main.dart에 이름 지어준 것을 사용.
              context.go('/error');
            },
            child: Text('Error Screen (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              // context.go('/one/two/three');
              //main.dart에 이름 지어준 것을 사용.
              context.go('/login');
            },
            child: Text('Login Screen (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              // context.go('/one/two/three');
              //main.dart에 이름 지어준 것을 사용.

              //redirect 실행해서
              ref.read(userProvider.notifier).logout();

              context.go('/logout');
            },
            child: Text('Logout Screen (GO)'),
          ),
        ],
      ),
    );
  }
}
