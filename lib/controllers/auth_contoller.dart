import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:todo_getx/views/home_view.dart';

class AuthContoller extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("สำเร็จ", "สมัครสมาชิกเสร็จสิ้น");
    } catch (e) {
      Get.snackbar("ล้มเหลว", e.toString());
    }
  }

  Future<void> Login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("สำเร็จ", "เข้าสู่ระบสำเร็จ");
      Get.off(HomeView());
    } catch (e) {
      Get.snackbar("ล้มเหลว", e.toString());
    }
  }
}
