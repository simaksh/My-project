import 'package:get/get.dart';

import '../controller/add-saller-page-controller.dart';
class AddSallerBinding extends Bindings{
  @override
  void dependencies() =>Get.lazyPut(() => AddSellerController());

}