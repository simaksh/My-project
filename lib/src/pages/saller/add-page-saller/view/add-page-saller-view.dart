import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled121/src/pages/saller/add-page-saller/controller/add-saller-page-controller.dart';


class AddSellerPageView extends GetView<AddSellerController> {
  const AddSellerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 16),
              child: TextFormField(
                controller: controller.titleTextController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                controller: controller.descriptionTextController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                controller: controller.priceTextController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                controller: controller.countTextController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Count',
                ),
              ),
            ),
            Obx(() {
              return controller.isSubmitLoading.value
                  ? _submitLoading()
                  : ElevatedButton(
                onPressed: () {
                  controller.addProduct();

                  Get.back();
                },
                child: const Text('Submit'),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _submitLoading() => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      border: Border.all(color: Colors.grey),
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
        Text(
          'Submit',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}