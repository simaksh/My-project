

import 'dart:convert';

import 'package:either_dart/either.dart';

import 'package:untitled121/src/infrastructor/commons/repository-Url.dart';


import 'package:http/http.dart'as http;
import 'package:untitled121/src/pages/customer/model/todo-view-model-customer.dart';

class CustomerRepository{
  Future<Either<String, List<TodoViewModelCustomer>>> getCustomerProducts() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      var url = Uri.http(
          RepositoryUrl.webBaseUrl
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> todosList = jsonDecode(response.body);
        final product= todosList.map((todoJson) =>
            TodoViewModelCustomer.fromJson(todoJson)).toList();
        return Right(product);
      } else {
        return Left('${response.statusCode}');
      }
    } catch (error) {
      return Left(error.toString());
    }
  }
}

