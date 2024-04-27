import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_test/features/lesson/domain/entity/session_entity.dart';

import '../../../../core/error/faliures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/session_repository.dart';

class GetAllSessionUsecase
    implements Usecase<List<SessionsEntity>, SessionParams> {
  final SessionRepository sessionRepository;
  const GetAllSessionUsecase({required this.sessionRepository});

  @override
  Future<Either<Failure, List<SessionsEntity>>> call(
      SessionParams params) async {
    return await sessionRepository.getAllSession();
  }
}

class SessionParams extends Equatable {
  @override
  List<Object?> get props => [];
}
