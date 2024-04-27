import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/faliures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class RegisterUsecase implements Usecase<String, RegisterParams> {
  final AuthRepository authRepository;

  const RegisterUsecase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(RegisterParams params) async {
    return await authRepository.register(
        userName: params.userName,
        gender: params.gender,
        email: params.email,
        password: params.password);
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String gender;
  final String userName;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.gender,
    required this.userName,
  });

  @override
  List<Object?> get props => [email, password, gender, userName];
}
