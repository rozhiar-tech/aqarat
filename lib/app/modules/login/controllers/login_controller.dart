import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginController extends GetxController {
  RxString title = 'Login'.obs;
  RxBool isLoggingIn = false.obs;
  RxBool isLoading = false.obs;


  Future<bool> loginWithEmailPassword(String email, String password) async {
    try {
      isLoggingIn.value = true;

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If login is successful, return true
      isLoggingIn.value = false;
      print('Login successful! User: ${userCredential.user?.email}');
      Get.toNamed('/dashboard', arguments: userCredential.user!.uid);
      return true;
    } catch (e) {
      // Handle login errors here (e.g., display an error message)
      print('Login failed: $e');
      return false; // Return false in case of failure
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
