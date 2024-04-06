import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopIngCartView extends GetView<GetxController> {
  const ShopIngCartView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('ShopIngCart'),
        ),
      );
}
