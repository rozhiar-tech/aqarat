import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/propety_form_controller.dart';

class PropetyFormView extends GetView<PropetyFormController> {
  const PropetyFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: PropetyFormController(), // Initialize your controller here
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.title.value),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey, // formKey is defined in the controller
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Property Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a property name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.propertyName.value = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Price (\$)',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a price';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.price.value = double.parse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Location',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.location.value = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.phone.value = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.description.value = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Validate the form
                      if (controller.formKey.currentState!.validate()) {
                        // Save the form data
                        controller.formKey.currentState!.save();
                        // You can call a function in the controller to save data or perform actions
                        controller
                            .saveFormToFirebase(); // Define this function in your controller
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
