import 'package:get/get.dart';

import '../controller/shping-cart-contriller.dart';

class ShopingCartBinding extends Bindings{
  @override
  void dependencies() =>Get.lazyPut(() => ShopingCartController());

}