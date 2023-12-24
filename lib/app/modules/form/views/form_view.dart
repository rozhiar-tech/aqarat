import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: FormController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              controller.sharedLang.value == 'Arabic'
                  ? 'نموذج طلب ملكية'
                  : controller.sharedLang.value == 'Arabic_EG'
                      ? 'فۆڕمی داوا کردنی موڵک'
                      : controller.title.value,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey, // formKey is defined in the controller
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: controller.sharedLang.value == 'Arabic'
                          ? 'اسم العقار'
                          : controller.sharedLang.value == 'Arabic_EG'
                              ? 'ناوی موڵک'
                              : "Property Name",
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
                      labelText: controller.sharedLang.value == 'Arabic'
                          ? 'سعر'
                          : controller.sharedLang.value == 'Arabic_EG'
                              ? 'نرخ'
                              : "'Price (\$)'",
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
                      labelText: controller.sharedLang.value == 'Arabic'
                          ? 'مکان'
                          : controller.sharedLang.value == 'Arabic_EG'
                              ? 'شوێن'
                              : "Location",
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
                      labelText: controller.sharedLang.value == 'Arabic'
                          ? 'رقم الهاتف'
                          : controller.sharedLang.value == 'Arabic_EG'
                              ? 'ژمارە تەلەفون'
                              : "Phone Number",
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
                      labelText: controller.sharedLang.value == 'Arabic'
                          ? 'وصف'
                          : controller.sharedLang.value == 'Arabic_EG'
                              ? 'درێژە'
                              : "Description",
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
                        // Save the form data to Firebase
                        controller.formKey.currentState!.save();
                        controller
                            .saveFormToFirebase(); // Define this function in the controller
                      }
                    },
                    child: Text(
                      controller.sharedLang.value == 'Arabic'
                          ? 'تقدیم'
                          : controller.sharedLang.value == 'Arabic_EG'
                              ? 'پێشکەش کردن'
                              : "Submit",
                      style: const TextStyle(color: Colors.white),
                    ),
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
