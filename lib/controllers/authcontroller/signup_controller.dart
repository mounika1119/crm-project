import 'package:crm_fugen/screens/dashboardscreen/homepage_screen.dart';
import 'package:crm_fugen/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/auth_model/signin_model.dart';


class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  final usernameController = TextEditingController();
  final roleController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() {
    if (formKey.currentState!.validate()) {
      String username = usernameController.text;
      String role = roleController.text;
      String email = emailController.text;
      String password = passwordController.text;

      Get.snackbar("Success", "Signed in as $email");
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    roleController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
