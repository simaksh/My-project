import 'package:get/get.dart';
import 'package:untitled121/src/pages/saller/edit-page-saller/model/edit-todo-saller.dart';
import 'package:untitled121/src/pages/saller/edit-page-saller/view/edit-page-saller.dart';
import 'package:untitled121/src/pages/saller/model/todo-view-model-saller.dart';

import '../../../infrastructure/commons/route-name.dart';
import '../repository/saller-page-repository.dart';

class SellerPageController extends GetxController {
  final SellerPageRepository _repository = SellerPageRepository();
  RxList<TodoViewModelSaller> product = <TodoViewModelSaller>[].obs;
  RxBool isLoading = true.obs;
  RxBool isRetryMode = false.obs;
  RxMap<String, bool> isEditLoadingMap = <String, bool>{}.obs;
  RxMap<String, bool> isEditLoading = <String, bool>{}.obs;
  RxMap<String, bool> isDeleteLoadingMap = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  Future<void> getProduct() async {
    try {
      isLoading.value = true;
      final resultOrException = await _repository.getProduct();
      isLoading.value = false;

      resultOrException.fold(
        (exception) {
          isRetryMode.value = true;
          Get.showSnackbar(
            GetSnackBar(
              message: 'Error.StatusCode $exception',
            ),
          );
        },
        (todosResponse) {
          product.assignAll(todosResponse);
        },
      );
    } catch (error) {
      Get.showSnackbar(
        GetSnackBar(
          title: '$error',
        ),
      );
    }
  }

  Future<void> goToAddPage() async {
    final result = await Get.toNamed(RouteName.addSeller);
    if (result != null) {
      final TodoViewModelSaller newTodo = TodoViewModelSaller.fromJson(result);
      product.add(newTodo);
    }
  }

  Future<void> deleteProduct({
    required String id,
  }) async {
    isDeleteLoadingMap[id] = true;
    await Future.delayed(const Duration(seconds: 2));

    final resultOrException = await _repository.deleteProduct(id: id);
    isDeleteLoadingMap[id] = false;

    resultOrException.fold(
      (exception) => Get.showSnackbar(
        GetSnackBar(
          title: exception,
        ),
      ),
      (right) {
        product.removeWhere((item) => item.id == id);
      },
    );
  }

  Future<void> toggleTodoIsCompleted({
    required TodoViewModelSaller products,
    required bool newValue,
  }) async {
    isEditLoadingMap[products.id] = false;

    final EditTodoSellerDto dto = EditTodoSellerDto(
        description: products.description,
        count: products.count,
        price: products.price,
        title: products.title,
        id: products.id);

    final resultOrException = await _repository.toggleTodoIsCompleted(dto: dto);
    isEditLoadingMap[products.id] = true;

    resultOrException.fold(
      (exception) => Get.showSnackbar(
        GetSnackBar(
          title: exception,
        ),
      ),
      (newTodo) {
        final int index =
            product.indexWhere((element) => element.id == products.id);
        if (index != -1) {
          product[index] = newTodo;
        }
      },
    );
  }

  void toggleTodoStatus(String productId, bool newValue) {
    final TodoViewModelSaller products =
        product.firstWhere((element) => element.id == productId);
    products.isActive = newValue;
  }

  Future<void> editProduct({
    required TodoViewModelSaller productss,
    required String newTitle,
    required String newDescription,
    required double newPrice,
    required double newCount,
  }) async {
    try {
      isEditLoading[productss.id] = true;

      final resultOrException = await _repository.toggleTodoIsCompleted(
        dto: EditTodoSellerDto(
            description: productss.description,
            count: productss.count,
            price: productss.price,
            title: productss.title,
            id: productss.id),
      );
      isEditLoading[productss.id] = false;
      resultOrException.fold(
        (exception) => Get.showSnackbar(
          GetSnackBar(
            title: exception,
          ),
        ),
        (newTodo) {
          final int index =
              product.indexWhere((element) => element.id == productss.id);
          if (index != -1) {
            product[index] = newTodo;
          }
        },
      );
    } catch (error) {
      Get.showSnackbar(
        GetSnackBar(
          title: '$error',
        ),
      );
    }
  }

  Future<void> goToEditPage(TodoViewModelSaller todo) async {
    await Get.to(() => EditTodoPage(
          todos: todo,
        ));
  }
}
