import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/auth_model/signin_model.dart';


class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  var rememberMe = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() {
    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      Get.snackbar("Success", "Signed in as $email");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
