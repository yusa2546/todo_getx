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
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.network(
              'https://i.pinimg.com/736x/73/4f/b2/734fb2cce364e9367c4aa4b513c4f2c0.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Text(
                      "Register",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://i.pinimg.com/736x/61/f9/eb/61f9ebf9301458c911b452d6bf966feb.jpg',
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.6,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 30),

                    // ช่องกรอกข้อมูล
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
                        if (passwordController.text !=
                            confirmPasswordController.text) {
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
            ),
          ),
        ],
      ),
    );
  }
}
