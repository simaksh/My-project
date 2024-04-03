import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled121/src/pages/customer/model/todo-view-model-customer.dart';

import '../repository/customer-repository.dart';

class CustomerPageController extends GetxController {
  final CustomerRepository _repository = CustomerRepository();
  RxList<TodoViewModelCustomer> products = <TodoViewModelCustomer>[].obs;
  RxBool isLoading = true.obs;

  final ValueNotifier<int> numberOfProducts = ValueNotifier<int>(1);

  @override
  void onInit() {
    super.onInit();
    getCustomerProducts();
  }

  Future<void> getCustomerProducts() async {
    isLoading.value = true;
    final result = await _repository.getCustomerProducts();
    isLoading.value = false;

    result.fold(
          (error) => print('Error: $error'),
          (productList) => products.assignAll(productList),
    );
  }
}
