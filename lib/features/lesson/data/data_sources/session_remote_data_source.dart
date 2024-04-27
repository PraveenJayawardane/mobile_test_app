import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_app_test/core/error/faliures.dart';
import 'package:mobile_app_test/features/lesson/data/models/session_model.dart';

import '../../../../core/constant/app_const_string.dart';

abstract class SessionRemoteDataSource {
  Future<List<SessionModel>> getAllSession({required String token});
}

class SessionRemoteDataSourceImpl implements SessionRemoteDataSource {
  final http.Client client;

  SessionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SessionModel>> getAllSession({required String token}) async {
    try {
      final responce = await client.get(Uri.parse("$baseUrl/v1/sessions"),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      if (responce.statusCode == 200) {
        List content = jsonDecode(responce.body);
        return content.map((e) => SessionModel.fromJson(e)).toList();
      } else {
        throw const SessionFailure(message: 'Error');
      }
    } on Exception {
      throw const ServerFailure(message: checkInternet);
    }
  }
}
