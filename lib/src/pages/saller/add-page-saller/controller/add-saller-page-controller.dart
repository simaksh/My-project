import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled121/src/pages/saller/add-page-saller/model/todo-dto-seller.dart';
import 'package:untitled121/src/pages/saller/add-page-saller/repository/add-repository-seller.dart';


class AddSellerController extends GetxController {
  final AddRepositorySaller _repository = AddRepositorySaller();
  final TextEditingController titleTextController = TextEditingController(),
      descriptionTextController = TextEditingController(),countTextController=TextEditingController(),priceTextController=TextEditingController();

  final RxBool isSubmitLoading = false.obs;
  Uint8List?selectImage;

  @override
  void onClose() {
    super.onClose();
    titleTextController.dispose();
descriptionTextController.dispose();
priceTextController.dispose();
countTextController.dispose();
  }

  Future<void> addProduct() async {
    isSubmitLoading.value = true;
    String imageBase64='';
    if(selectImage!=null){
      imageBase64=base64Encode(selectImage!);
    }
    final dto = TodoDtoSeller(
      title: titleTextController.text,
      description:descriptionTextController.text, price: double.parse(priceTextController.text), count: double.parse(countTextController.text), imageBase64:imageBase64,
    );

    final resultOrException = await _repository.addProduct(dto: dto);

    isSubmitLoading.value = false;

    resultOrException.fold(
            (left) => Get.showSnackbar(GetSnackBar(
          message: left,
        )), (right) {
      Get.back(result: right);
    });
  }

}
