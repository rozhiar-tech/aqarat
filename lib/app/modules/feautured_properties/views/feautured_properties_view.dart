import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feautured_properties_controller.dart';

class FeauturedPropertiesView extends GetView<FeauturedPropertiesController> {
  const FeauturedPropertiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeauturedPropertiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FeauturedPropertiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
