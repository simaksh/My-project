import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:either_dart/either.dart';

import '../model/todo-dto.dart';

class SignupRepository {
  Future<Either<String, String>> signupUser(TodoDto dto) async {
    try {
      var url = Uri.http(' http://localhost:3000', '/users');
      final response = await http.post(
        url,
        body: jsonEncode(dto.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode >= 200 && response.statusCode < 400) {

        return const Right('User signed up successfully');
      } else {

        return Left('Error: ${response.statusCode}');
      }
    } catch (error) {
      print(error);
      return Left('Error: $error');
    }
  }
}