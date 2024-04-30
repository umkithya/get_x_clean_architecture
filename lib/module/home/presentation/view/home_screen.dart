import 'package:flutter/material.dart';
import 'package:testproject/module/home/presentation/controller/home_controller.dart';

import '../../../../utils/helper/state_manager/my_state_manager.dart';
import '../widget/home_body.dart';

class HomeScreen extends BindingInjection<HomeController> {
  const HomeScreen({super.key, super.binding});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const HomeBody(),
    );
  }
}
