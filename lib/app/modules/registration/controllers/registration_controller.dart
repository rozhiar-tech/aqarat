import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user information in Firestore after successful registration
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'name': email.toString().substring(0, 3),
        'id': userCredential.user?.uid,
        // Add other user details here
      });

      print('Registration successful! User ID: ${userCredential.user!.uid}');
      return true;
    } catch (e) {
      print('Registration failed: $e');
      return false;
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
