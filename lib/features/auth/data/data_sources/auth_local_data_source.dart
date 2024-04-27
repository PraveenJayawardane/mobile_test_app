import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faliures.dart';
import '../../domain/entities/login_entity.dart';
import '../models/login_model.dart';

abstract class AuthLocalDataSource {
  void setCurrentUser({required LoginModel loginModel});

  Either<Failure, LoginEntity> getCurrentUser();

  Future<bool> deleteCurrentUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  void setCurrentUser({required LoginModel loginModel}) {
    try {
      String userCredentials =
          jsonEncode(LoginModel.toJson(loginEntity: loginModel));
      sharedPreferences.setString('currentUser', userCredentials);
    } on CacheException catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Either<Failure, LoginEntity> getCurrentUser() {
    try {
      var currentUser = sharedPreferences.getString("currentUser");
      if (currentUser != null) {
        return Right(LoginModel.fromJson(jsonDecode(currentUser)));
      }
      return const Left(CacheFailure(message: 'No user found'));
    } on CacheException catch (e) {
      throw Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<bool> deleteCurrentUser() async {
    return await sharedPreferences.clear().then((value) {
      if (value) {
        return true;
      } else {
        return false;
      }
    });
  }
}
