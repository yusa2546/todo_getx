import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:todo_getx/controllers/auth_contoller.dart';
import 'package:todo_getx/widgets/app_text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  AuthContoller authContoller = Get.put(AuthContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Register",
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 35, 71, 61),
      ),

      body: Container(
        color: Color.fromARGB(255, 17, 61, 48), // Border color
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://i.pinimg.com/736x/9d/a3/bf/9da3bf2a02508cda70113bc073c87ad5.jpg',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.cover,
              ),
            ),

            AppTextField(lable: "email", controller: emailController),
            SizedBox(height: 10),
            AppTextField(
              lable: "password",
              controller: passwordController,
              hideText: true,
            ),
            SizedBox(height: 10),
            AppTextField(
              lable: "confirm password",
              controller: confirmPasswordController,
              hideText: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (!GetUtils.isEmail(emailController.text)) {
                  Get.snackbar(('Error'), 'Invalid Email');
                  return;
                }
                if (passwordController.text.length < 6) {
                  Get.snackbar('Error', 'Password dose 6 char');
                }
                if (passwordController.text != confirmPasswordController.text) {
                  Get.snackbar('Error', 'Password dose not match');
                  return;
                }
                authContoller.register(
                  emailController.text,
                  passwordController.text,
                );
                Get.back();
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
