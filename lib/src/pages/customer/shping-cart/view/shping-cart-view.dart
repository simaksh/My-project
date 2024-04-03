import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ShopingCartView extends GetView<GetxController>{
  const ShopingCartView({super.key});

  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(title: const Text('ShopingCart'),),
  );
  }

