import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxString title='Property Request Form'.obs;

  RxString propertyName = ''.obs;
  RxDouble price = 0.0.obs;
  RxString location = ''.obs;
  RxString description = ''.obs;

  Future<void> saveFormToFirebase() async {
    try {
      await FirebaseFirestore.instance.collection('requests').add({
        'propertyName': propertyName.value,
        'price': price.value,
        'location': location.value,
        'description': description.value,
      });

      // Reset form fields after successful submission
      formKey.currentState!.reset();
      propertyName.value = '';
      price.value = 0.0;
      location.value = '';
      description.value = '';
    } catch (e) {
      print('Error saving form data: $e');
    }
  }
}
