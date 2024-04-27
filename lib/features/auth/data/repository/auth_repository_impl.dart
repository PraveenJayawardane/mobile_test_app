import 'package:dartz/dartz.dart';

import '../../../../core/error/faliures.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_sources.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl(
      {required this.authLocalDataSource, required this.authRemoteDataSource});

  @override
  Future<Either<Failure, LoginEntity>> logIn(
      {required String email, required String password}) async {
    try {
      final response =
          await authRemoteDataSource.login(email: email, password: password);
      authLocalDataSource.setCurrentUser(loginModel: response);
      return Right(response);
    } on LoginFailure catch (e) {
      return Left(LoginFailure(message: e.message));
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> register(
      {required String userName,
      required String password,
      required String gender,
      required String email}) async {
    try {
      final responce = await authRemoteDataSource.register(
          userName: userName, email: email, gender: gender, password: password);
      return Right(responce);
    } on RegisterFailure catch (e) {
      return Left(RegisterFailure(message: e.message));
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<bool> logOut() async {
    return await authLocalDataSource.deleteCurrentUser();
  }
}
