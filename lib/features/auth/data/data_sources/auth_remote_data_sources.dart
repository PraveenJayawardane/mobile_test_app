import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_app_test/core/error/faliures.dart';

import '../../../../core/constant/app_const_string.dart';
import '../models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login({required String email, required String password});

  Future<String> register(
      {required String userName,
      required String email,
      required String gender,
      required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> login(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> body = {
        "email": email.trim(),
        "password": password.trim()
      };
      final responce = await client.post(
        Uri.parse("$baseUrl/v1/auth/login"),
        body: body,
      );
      Map<String, dynamic> jsonMap = jsonDecode(responce.body);
      if (responce.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(responce.body));
      } else {
        throw LoginFailure(message: jsonMap['msg']);
      }
    } on Exception {
      throw const ServerFailure(message: checkInternet);
    }
  }

  @override
  Future<String> register(
      {required String userName,
      required String email,
      required String password,
      required String gender}) async {
    try {
      Map<String, dynamic> body = {
        "username": userName,
        "email": email.trim(),
        "gender": gender.trim(),
        "password": password.trim()
      };
      final responce =
          await client.post(Uri.parse("$baseUrl/v1/auth/register"), body: body);
      if (responce.statusCode == 201) {
        Map<String, dynamic> jsonMap = jsonDecode(responce.body);
        return jsonMap['msg'];
      } else {
        throw const RegisterFailure(message: "Error");
      }
    } on Exception {
      throw const ServerFailure(message: checkInternet);
    }
  }
}
