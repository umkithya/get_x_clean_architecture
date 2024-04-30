import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testproject/module/detail/presentation/binding/detail_binding.dart';
import 'package:testproject/module/detail/presentation/page/detail_screen.dart';
import 'package:testproject/module/home/presentation/binding/home_binding.dart';

import 'module/home/presentation/view/home_screen.dart';
import 'utils/service/start_up_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => StartUpService().init());

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(
        binding: HomeBinding(),
      ),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => DetailScreen(
        binding: DetailBinding(),
      ),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      builder: DevicePreview.appBuilder,
      routerConfig: _router,
    );
  }
}
