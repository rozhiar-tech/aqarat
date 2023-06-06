import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/single_property_controller.dart';

class SinglePropertyView extends GetView<SinglePropertyController> {
  const SinglePropertyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SinglePropertyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SinglePropertyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
