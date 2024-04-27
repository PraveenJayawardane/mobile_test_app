import 'package:dartz/dartz.dart';
import 'package:mobile_app_test/features/lesson/domain/entity/session_entity.dart';

import '../../../../core/error/faliures.dart';
import '../../../auth/data/data_sources/auth_local_data_source.dart';
import '../../domain/repository/session_repository.dart';
import '../data_sources/session_remote_data_source.dart';

class SessionRepositoryImpl implements SessionRepository {
  final SessionRemoteDataSource sessionRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  SessionRepositoryImpl(
      {required this.sessionRemoteDataSource,
      required this.authLocalDataSource});

  @override
  Future<Either<Failure, List<SessionsEntity>>> getAllSession() async {
    try {
      final response = await sessionRemoteDataSource.getAllSession(
          token: authLocalDataSource
              .getCurrentUser()
              .fold((l) => '', (r) => r.token!));
      return Right(response);
    } on LoginFailure catch (e) {
      return Left(SessionFailure(message: e.message));
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
