import 'package:flutter/material.dart';
import 'package:testproject/module/detail/presentation/controller/detail_controller.dart';
import 'package:testproject/utils/helper/state_manager/my_state_manager.dart';

class DetailScreen extends BindingInjection<DetailController> {
  const DetailScreen({super.key, super.binding});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: const Center(
        child: Text("Details"),
      ),
    );
  }
}
