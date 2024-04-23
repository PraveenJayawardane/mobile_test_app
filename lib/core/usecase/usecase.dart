import 'package:dartz/dartz.dart';

import '../error/faliures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class NoTypeUsecase<Type, Params> {
  Future<Type> call(Params params);
}

typedef ApiHandler = Future<Either<Failure, Type>> Function();
