import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled121/src/infrastructor/commons/route-name.dart';

import '../controller/customer-page-controller.dart';

class CustomerPageView extends GetView<CustomerPageController> {
  const CustomerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Page'),
      ),
      body: Stack(
        children: [
          Obx(
                () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: Text('\$${product.price}'),
                );
              },
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.shpingCart);
              },

              child: const Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.cyan,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteName.shpingCart);
        },
backgroundColor: Colors.white,
        child: const Icon(Icons.add_shopping_cart,color:Colors.cyan),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}