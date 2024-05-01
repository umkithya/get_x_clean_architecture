import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../module/detail/presentation/binding/detail_binding.dart';
import '../module/detail/presentation/page/detail_screen.dart';
import '../module/home/presentation/binding/home_binding.dart';
import '../module/home/presentation/view/home_screen.dart';

final GoRouter router = GoRouter(
  navigatorKey: Get.key,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(
              key: state.pageKey,
              binding: HomeBinding(),
            ),
        routes: [
          GoRoute(
            path: 'detail',
            builder: (context, state) {
              debugPrint("${state.uri}");
              return DetailScreen(
                key: state.pageKey,
                binding: DetailBinding(),
              );
            },
          ),
        ]),
  ],
);
