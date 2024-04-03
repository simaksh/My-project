

import 'dart:convert';

import 'package:either_dart/either.dart';

import 'package:untitled121/src/infrastructor/commons/repository-Url.dart';

import '../model/todo-view-model.dart';
import 'package:http/http.dart'as http;

class HomeRepository {
  Future<Either<String, List<TodoViewModel>>> login() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      var url = Uri.http(
       RepositoryUrl.webBaseUrl
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> todosList = jsonDecode(response.body);
        final todos = todosList.map((todoJson) =>
            TodoViewModel.fromJson(todoJson)).toList();
        return Right(todos);
      } else {
        return Left('${response.statusCode}');
      }
    } catch (error) {
      return Left(error.toString());
    }
  }
}

