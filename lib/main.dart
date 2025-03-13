import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_getx/firebase_options.dart';
import 'package:todo_getx/services/storage_service.dart';
import 'package:todo_getx/views/login_view.dart';
//import 'package:todo_getx/views/home_view.dart';
//import 'package:todo_getx/views/register_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: "กล้วยซ์", home: LoginView());
  }
}
