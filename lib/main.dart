import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_acutal/provider/auth_provider.dart';
import 'package:go_router_acutal/screen/1_screen.dart';
import 'package:go_router_acutal/screen/2_screen.dart';
import 'package:go_router_acutal/screen/3_screen.dart';
import 'package:go_router_acutal/screen/error_screen.dart';
import 'package:go_router_acutal/screen/home_screen.dart';

void main() => runApp(ProviderScope(child: _App()));

/// The route configuration.


class _App extends ConsumerWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(routerProvider);

// Go Router 1
    return MaterialApp.router(
      routerConfig: state,
    );
  }
}
