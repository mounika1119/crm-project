import 'package:crm_fugen/screens/authscreen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/authcontroller/signin_controller.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  bool passwordVisible=false;

  InputDecoration _inputDecoration({
    required String hintText,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(prefixIcon, color: Colors.grey),
      suffixIcon: suffixIcon,
      // filled: true,
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Color(0xFF2C2A85)),
      ),
    );
  }
  // InputDecoration _inputDecoration({
  //   required String hintText,
  //   required IconData prefixIcon,
  //   Widget? suffixIcon,
  // }) {
  //   return InputDecoration(
  //     hintText: hintText,
  //     prefixIcon: Icon(prefixIcon, color: Colors.white),
  //     suffixIcon: suffixIcon,
  //     filled: true,
  //     fillColor: Colors.grey[850],
  //     hintStyle: const TextStyle(color: Colors.white70),
  //     contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(30),
  //       borderSide: const BorderSide(color: Colors.blue),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  const Text("Email",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: _inputDecoration(  hintText: "Enter your email",
                      prefixIcon: Icons.email,),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value != null && value.contains('@')
                        ? null
                        : "Enter a valid email",
                  ),
                  const SizedBox(height: 10),
                  const Text("Password",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: _inputDecoration(hintText: "Password",
                      prefixIcon: Icons.lock,
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          // setState(
                          //       () {
                          //     passwordVisible = !passwordVisible;
                          //   },
                          // );
                        },
                      ),

                    ),
                    validator: (value) => value != null && value.length >= 6
                        ? null
                        : "Enter password",
                  ),
                  const SizedBox(height: 5),
                  Obx(() => Row(
                        children: [
                          Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) =>
                                controller.rememberMe.value = value ?? false,
                            checkColor: Colors.black,
                            activeColor: Colors.white,
                          ),
                          const Text("Remember Me",
                              style: TextStyle(color: Colors.black)),
                        ],
                      )),
                  const SizedBox(height: 30),
                  Obx(() => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.signIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2C2A85),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text("Sign In",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white))),
                      )
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) =>   SignUpScreen()),
                        );
                      },
                      child: const Center(
                        child: Text.rich(TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


