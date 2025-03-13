import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class AddTodoView extends StatelessWidget {
  AddTodoView({super.key});

  final TodoController todoControler = Get.put(TodoController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Todo',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(11, 49, 30, 0.859),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Image.network(
              'https://i.pinimg.com/736x/7f/2e/b4/7f2eb49353a0127b741e1a2d69805f99.jpg',
            ),

            Text(
              "Product Name",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 5, 65, 45),
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 5, 65, 45),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: InputBorder.none, // Remove default underline
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "price",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 5, 65, 45),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 5, 65, 45),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'price',
                  border: InputBorder.none, // Remove default underline
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                todoControler.addTodo(
                  titleController.text,
                  descriptionController.text,
                );
                Get.back();
              },
              child: Text(
                "Submit",
                style: TextStyle(color: const Color.fromARGB(255, 5, 65, 45)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
