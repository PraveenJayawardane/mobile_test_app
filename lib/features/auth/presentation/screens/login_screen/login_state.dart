import 'package:mobile_app_test/features/auth/domain/entities/login_entity.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginEntity loginEntity;

  LoginLoaded({required this.loginEntity});
}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}
