import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import 'package:untitled121/src/pages/saller/edit-page-saller/model/edit-todo-saller.dart';
import 'package:untitled121/src/pages/saller/model/todo-view-model-saller.dart';

import '../../../infrastructure/commons/repository-Url.dart';

class SellerPageRepository {
  Future<Either<String, List<TodoViewModelSaller>>> getProduct() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      var url = Uri.http(RepositoryUrl.webBaseUrl);
      final response = await http.get(url);

      if (response.statusCode == 200 && response.statusCode < 400) {
        final List<dynamic> todosList = jsonDecode(response.body);
        final todos = todosList
            .map((todoJson) => TodoViewModelSaller.fromJson(todoJson))
            .toList();
        return Right(todos);
      } else {
        return Left('${response.statusCode}');
      }
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, String>> deleteProduct({
    required String id,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 4));
      final url =
          Uri.http(RepositoryUrl.webBaseUrl, RepositoryUrl.deleteProduct(id));

      final response = await http.delete(url);

      if (response.statusCode >= 200 && response.statusCode < 400) {
        return Right(response.body);
      } else {
        return Left('${response.statusCode}');
      }
    } catch (error) {
      return Left('$error');
    }
  }

  Future<Either<String, TodoViewModelSaller>> toggleTodoIsCompleted({
    required EditTodoSellerDto dto,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await Future.delayed(const Duration(seconds: 5));
      final url =
          Uri.http(RepositoryUrl.webBaseUrl, RepositoryUrl.editProduct(dto.id));

      final response = await http.patch(
        url,
        body: jsonEncode(dto.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode >= 200 && response.statusCode < 400) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final TodoViewModelSaller todo = TodoViewModelSaller.fromJson(json);
        return Right(todo);
      } else {
        return Left('${response.statusCode}');
      }
    } catch (error) {
      return Left('$error');
    }
  }

  Future<TodoViewModelSaller> editProduct({
    required EditTodoSellerDto dto,
  }) async {
    final response = await http.put(
      Uri(),
      body: json.encode(dto.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 && response.statusCode < 400) {
      return TodoViewModelSaller.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to edit todo: ${response.statusCode}');
    }
  }
}
