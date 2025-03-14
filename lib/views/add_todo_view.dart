import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';

class AddTodoView extends StatefulWidget {
  AddTodoView({super.key, this.todo});
  TodoModel? todo;

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final TodoController todoControler = Get.put(TodoController());

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      titleController.text = widget.todo!.title;
      descriptionController.text = widget.todo!.description;
    }
  }

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
              widget.todo != null ? "edit todo" : "Add Todo",
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
                if (titleController.text.isEmpty) return;
                if (widget.todo != null) {
                  widget.todo!.title = titleController.text;
                  widget.todo!.description = descriptionController.text;
                  todoControler.updateTodo(widget.todo!);
                } else {
                  todoControler.addTodo(
                    titleController.text,
                    descriptionController.text,
                    false,
                  );
                }
                Get.back();
                Get.snackbar('สำเร็จ', 'เพิ่มข้อมูลสำเร็จ');
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
