import 'package:get/get.dart';

import '../controller/customer-page-controller.dart';

class CustomerBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CustomerPageController());
}
