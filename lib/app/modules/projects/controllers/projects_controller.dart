import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProjectsController extends GetxController {
  //TODO: Implement ProjectsController
  RxString title = 'Projects'.obs;
  RxList projects = [].obs;

  retrieveProjectsFromFirebase() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('projects').get();
    projects.value = querySnapshot.docs;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    retrieveProjectsFromFirebase();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
