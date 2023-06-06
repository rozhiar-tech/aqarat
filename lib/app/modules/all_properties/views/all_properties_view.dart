import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_properties_controller.dart';

class AllPropertiesView extends GetView<AllPropertiesController> {
  const AllPropertiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllPropertiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllPropertiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
