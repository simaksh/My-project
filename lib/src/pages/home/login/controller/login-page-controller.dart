import 'package:get/get.dart';
import 'package:untitled121/src/pages/home/login/controller/user-type-enum.dart';

import '../repository/login-repository.dart';

class LoginPageController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  Future<void> login() async {
    final result = await _homeRepository.login();
    result.fold(
      (error) => Get.snackbar('Error', error),
      (data) {
        if (data.isEmpty) {
          Get.snackbar('Login Failed', 'Invalid username or password');
        } else {
          final userType = data.first.userName;
          if (userType == UserType.seller) {
            Get.toNamed('/seller_page');
          } else {
            Get.toNamed('/customer_page');
          }
        }
      },
    );
  }
}
