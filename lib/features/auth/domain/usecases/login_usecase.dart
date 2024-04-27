import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/faliures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login_entity.dart';
import '../repository/auth_repository.dart';

class LoginUsecase implements Usecase<LoginEntity, LoginParams> {
  final AuthRepository authRepository;

  const LoginUsecase({required this.authRepository});
  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params) async {
    return await authRepository.logIn(
        email: params.email, password: params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
