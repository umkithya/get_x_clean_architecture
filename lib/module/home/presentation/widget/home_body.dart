import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../controller/home_controller.dart';

class HomeBody extends GetView<HomeController> {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => RefreshIndicator(
        onRefresh: () => controller.getProducts(),
        child: ListView.separated(
          itemCount: state!.length,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              context.push('/detail');
            },
            title: Text("${state[index].title}"),
          ),
        ),
      ),
      onLoading: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      onEmpty: const Center(child: Text('No data found')),
      onError: (error) => Center(child: Text("$error")),
    );
  }
}
