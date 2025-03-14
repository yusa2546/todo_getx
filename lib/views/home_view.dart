import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_contoller.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/views/add_todo_view.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  TodoController todoController = Get.put(TodoController());
  AuthContoller authContoller = Get.put(AuthContoller());

  @override
  Widget build(BuildContext context) {
    todoController.fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Main App',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        backgroundColor: Color.fromRGBO(10, 71, 61, 0.859),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              todoController.clearTodo();
              authContoller.logout();
            },
          ),
        ],
      ),
      body: Obx(() {
        return Column(
          children: [
            Text("Shop", style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: todoController.todoList.length,
                itemBuilder: (context, index) {
                  TodoModel todo = todoController.todoList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            todo.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            todo.description,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 23, 56, 28),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Checkbox(
                            value: todo.isDone,
                            onChanged: (bool? newValue) {
                              todoController.toggelTodo(index);
                            },
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              todoController.deleteTodo(todo.docId ?? '');
                            },
                            icon: Icon(Icons.delete, color: Colors.redAccent),
                          ),
                        ),
                        onTap: () {
                          Get.to(AddTodoView(todo: todo));
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodoView());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
