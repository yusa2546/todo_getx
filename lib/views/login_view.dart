import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_contoller.dart';
import 'package:todo_getx/views/register_view.dart';
import 'package:todo_getx/widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthContoller authContoller = Get.put(AuthContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 25,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 61, 48),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
      
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    16,
                  ), 
                  child: Image.network(
                    'https://i.pinimg.com/736x/22/6d/09/226d09d8c22af635dd07a03b7f20999e.jpg',
                    width:
                        MediaQuery.of(context).size.width *
                        0.8, 
                    height:
                        MediaQuery.of(context).size.width *
                        0.6, 
                    fit: BoxFit.cover, 
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null)
                        return child; 
                      return Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      );
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ), 
              AppTextField(lable: 'Email', controller: emailController),
              SizedBox(height: 20), 
 
              AppTextField(
                lable: 'Password',
                controller: passwordController,
                hideText: true,
              ),
              SizedBox(height: 20), 
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  iconColor: Color.fromARGB(255, 17, 61, 48), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), 
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
                onPressed: () {

                  if (!GetUtils.isEmail(emailController.text)) {
                    Get.snackbar(
                      'Error',
                      'Invalid Email',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }

                  if (passwordController.text.length < 6) {
                    Get.snackbar(
                      'Error',
                      'Password must be at least 6 characters',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }

                  authContoller.Login(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 17, 61, 48)),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Get.to(RegisterView());
                },
                child: Text(
                  "Don't have an account? Register",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 17, 61, 48),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
