import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_contoller.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/services/storage_service.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  StorageService storageService = StorageService();
  AuthContoller authContoller = Get.put(AuthContoller());

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    var todos = await storageService.read(
      'todoList',
      authContoller.user.value?.uid ?? '',
    );
    if (todos != null) {
      todoList.value = List<TodoModel>.from(
        todos.map((x) => TodoModel.fromJson(x)),
      );
    }
  }

  Future<void> addTodo(String title, String description, bool isDone) async {
    TodoModel todo = TodoModel(
      title,
      description,
      isDone,
      uid: authContoller.user.value?.uid,
    );
    todoList.add(todo);
    await storageService.write('todoList', todo.toJson());
  }

  void toggelTodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
  }

  void clearTodo() {
    todoList.clear();
    storageService.write('todos', todoList.toJson());
  }
}
