import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginController extends GetxController {
  RxString title = 'Login'.obs;
  RxBool isLoggingIn = false.obs;

  // check if user is already logged in

  // create a function to Login with google
  Future loginWithGoogle() async {
    try {
      UserCredential userCredential;
      final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // print(userCredential.user!.displayName);
      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': userCredential.user!.displayName,
        'email': userCredential.user!.email,
        'profilePic': userCredential.user!.photoURL,
      });
      Get.toNamed('/dashboard', arguments: userCredential.user!.uid);
    } catch (e) {
      print(e);
    }
  }

  // create a function to Login with facebook

  Future loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      print(userCredential.user!.displayName);
      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': userCredential.user!.displayName,
        'email': userCredential.user!.email,
        'profilePic': userCredential.user!.photoURL,
      });
      Get.toNamed('/dashboard', arguments: userCredential.user!.uid);
    } catch (e) {
      print(e);
    }
  }

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
