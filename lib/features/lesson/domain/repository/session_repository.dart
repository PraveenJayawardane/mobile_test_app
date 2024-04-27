import 'package:dartz/dartz.dart';

import '../../../../core/error/faliures.dart';
import '../entity/session_entity.dart';

abstract class SessionRepository {
  Future<Either<Failure, List<SessionsEntity>>> getAllSession();
}
