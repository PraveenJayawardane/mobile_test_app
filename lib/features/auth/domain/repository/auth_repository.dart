import 'package:dartz/dartz.dart';

import '../../../../core/error/faliures.dart';
import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> logIn(
      {required String email, required String password});

  Future<Either<Failure, String>> register(
      {required String userName,
      required String password,
      required String gender,
      required String email});

  Future<bool> logOut();
}
