import 'package:get/get.dart';
import 'package:untitled121/src/pages/saller/controller/saller-page-controller.dart';

class SellerPageBinding extends Bindings{
  @override
  void dependencies() =>Get.lazyPut(() =>SallerPageController());
}