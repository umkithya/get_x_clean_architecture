import 'package:flutter/material.dart';
import 'package:testproject/module/detail/presentation/controller/detail_controller.dart';
import 'package:testproject/utils/helper/state_manager/my_state_manager.dart';

import '../widget/detail_body.dart';

class DetailScreen extends BindingInjection<DetailController> {
  const DetailScreen({super.key, super.binding});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: const DetailBody(),
    );
  }
}
