import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:untitled121/src/infrastructure/commons/route-name.dart';
import 'package:untitled121/src/pages/customer/commons/customer-binding.dart';
import 'package:untitled121/src/pages/customer/view/customer-page-view.dart';

import 'package:untitled121/src/pages/saller/add-page-saller/commons/add-seller-binding.dart';
import 'package:untitled121/src/pages/saller/commons/saller-page-binding.dart';
import '../../pages/customer/shping-cart/commons/shping-cart-binding.dart';
import '../../pages/customer/shping-cart/view/shping-cart-view.dart';
import '../../pages/home/login/commons/login-page-binding.dart';
import '../../pages/home/login/view/login-page-view.dart';
import '../../pages/home/signup/commons/signup-page-binding.dart';
import '../../pages/home/signup/view/signup-page-view.dart';
import '../../pages/saller/add-page-saller/view/add-page-saller-view.dart';
import '../../pages/saller/view/saller-page-view.dart';

class RoutePage {
  static List<GetPage> pages = [
    GetPage(
      name: RouteName.login,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: RouteName.signup,
      page: () => const SignupPageView(),
      binding: SignupPageBinding(),
    ),
    GetPage(
        name: RouteName.seller,
        page: () => SellerPageView(),
        binding: SellerPageBinding()),
    GetPage(
        name: RouteName.customer,
        page: () => const CustomerPageView(),
        binding: CustomerBinding()),
    GetPage(
        name: RouteName.addSeller,
        page: () => const AddSellerPageView(),
        binding: AddSallerBinding()),
    GetPage(
        name: RouteName.shopIngCart,
        page: () => const ShopIngCartView(),
        binding: ShopingCartBinding()),
  ];
}
