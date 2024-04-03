import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled121/src/pages/saller/model/todo-view-model-saller.dart';


class EditTodoPage extends StatelessWidget {
  final TodoViewModelSaller todos;

  const EditTodoPage({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController(text:todos.title);
    final TextEditingController descriptionController = TextEditingController(text: todos.description);
    final TextEditingController priceController = TextEditingController(text:todos.price.toString());
    final TextEditingController countController= TextEditingController(text: todos.count.toString());
    final TextEditingController idController = TextEditingController(text:todos.price.toString());



    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'description'),
            ),
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'price'),
            ),
            TextFormField(
              controller: countController,
              decoration: const InputDecoration(labelText: 'count'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(

              onPressed: () {

                final  controller = Get.find();
                controller.editTodo(newTitle: titleController.text, newCount:double.parse(countController.text) ,newDescription: descriptionController.text, newPrice: double.parse(priceController.text), newId:int.parse(idController.text),todos:todos, );
                Get.back();
              },

              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}