import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:untitled121/src/pages/saller/add-page-saller/model/todo-dto-seller.dart';
import 'package:http/http.dart'as http;
class AddRepositorySaller {
  Future<Either<String, Map<String, dynamic>>> addProduct({
    required TodoDtoSeller dto,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      var url = Uri.http('http://localhost:3000', '/product');
      final response = await http.post(
        url,
        body: jsonEncode(dto.toJson()),
        headers: <String,String> {'Content-Type': 'application/json'},
      );

      if (response.statusCode >=200 && response.statusCode<400) {
        return Right(jsonDecode(response.body));
      } else {
        return Left('${response.statusCode}');
      }
    } catch (error) {
      print(error);
      return Left(error.toString());
    }
  }
}