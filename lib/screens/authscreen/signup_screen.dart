import 'package:crm_fugen/screens/authscreen/signup_screen.dart';
import 'package:crm_fugen/screens/dashboardscreen/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/authcontroller/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  bool passwordVisible=false;

  InputDecoration _inputDecoration({
    required String hintText,
    // required String labelText,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      // labelText: labelText,
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
                    "Sign Up",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  const Text("User Name",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  TextFormField(
                    controller: controller.usernameController,
                    decoration: _inputDecoration(
                      // labelText: "Full Name",
                      hintText: "Enter your username",
                      prefixIcon: Icons.person),
                    validator: (value) => value != null
                        ? null
                        : "Enter a username",
                  ),
                  const SizedBox(height: 10),
                  const Text("Role",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  TextFormField(
                    controller: controller.roleController,
                    decoration: _inputDecoration(
                      // labelText:"Role",
                      hintText: "Enter your role",
                      prefixIcon: Icons.perm_contact_cal),
                    validator: (value) => value != null
                        ? null
                        : "Enter your role",
                  ),
                  const SizedBox(height: 10),
                  const Text("Email",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: _inputDecoration(
                      // labelText:"Email",
                      hintText: "Enter your email",
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
                  const SizedBox(height: 2),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: _inputDecoration(
                      // labelText: "Password",
                      hintText: "Password",
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
                  const SizedBox(height: 30),
                  Obx(() => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : controller.signUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2C2A85),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                            color: Colors.white)
                            : const Text("Sign Up",
                            style: TextStyle(
                                fontSize: 16, color: Colors.white))),
                  )
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      },
                      child: const Center(
                          child: Text("Homepage",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))
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


