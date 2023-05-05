import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_acutal/layout/default_layout.dart';
import 'package:go_router_acutal/provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: () {
                //로그인 정보 저장
                ref.read(userProvider.notifier).login(name: 'Code Factory');
              },
              child: Text('login'))
        ],
      ),
    );
  }
}
