import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled121/src/infrastructor/commons/route-name.dart';

import '../model/todo-dto.dart';
import '../repository/signup-repository.dart';

class SignupPageController extends GetxController {
  final SignupRepository _signupRepository = SignupRepository();

  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController userNameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController repeatPasswordTextController = TextEditingController();

  @override
  void onClose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    userNameTextController.dispose();
    passwordTextController.dispose();
    repeatPasswordTextController.dispose();
    super.onClose();
  }

  Future<void> signup() async {
    final dto = TodoDto(
      firstName: firstNameTextController.text,
      lastName: lastNameTextController.text,
      userName: userNameTextController.text,
      password: passwordTextController.text,
      repeatPassword: repeatPasswordTextController.text,
    );

    final result = await _signupRepository.signupUser(dto);
    result.fold(
          (error) => Get.snackbar('Error', error),
          (data) => Get.toNamed(RouteName.login),
    );
  }
}