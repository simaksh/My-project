import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/saller-page-controller.dart';
import '../model/todo-view-model-saller.dart';

class TodoItem extends GetView<SallerPageController> {
  const TodoItem({required this.product, super.key});

  final TodoViewModelSaller product;

  @override
  Widget build(BuildContext context) =>
      Card(
        color: Colors.pink,
        child: Row(
          children: [
            Expanded(
              child: Text(product.title),
            ),
            Obx(
                  () =>
              controller.isDeleteLoadingMap[product.id] ?? false ?
              Transform.scale(
                scale: 0.5,
                child: const CircularProgressIndicator(),
              ) :
              IconButton(
                onPressed: () => controller.deleteProduct(id: product.id),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
            Obx(
                  () =>
              controller.isEditLoading[product.id] ?? false ?
              Transform.scale(
                scale: 0.5,
                child: const CircularProgressIndicator(),
              ) :
              IconButton(
                onPressed: () =>
                    controller.editProduct(
                      productss: product,
                      newTitle: 'newTitle',
                      newDescription: 'newDescription',
                      newPrice: 1000,
                      newCount: 100,
                    ),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            Switch(
              value: product.isActive,
              onChanged: (newValue) {
                controller.toggleTodoStatus(product.id, newValue);
              },
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
            ),
          ],
        ),
      );
}