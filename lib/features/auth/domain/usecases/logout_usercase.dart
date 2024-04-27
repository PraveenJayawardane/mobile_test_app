import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class LogoutUsecase implements NoTypeUsecase {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  @override
  Future<bool> call(params) async {
    return await authRepository.logOut();
  }
}

class LogoutParams {}
