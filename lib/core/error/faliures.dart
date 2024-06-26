import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});

  @override
  List<Object?> get props => [message];
}

class LoginFailure extends Failure {
  const LoginFailure({required super.message});

  @override
  List<Object?> get props => [message];
}

class RegisterFailure extends Failure {
  const RegisterFailure({required super.message});

  @override
  List<Object?> get props => [message];
}

class SessionFailure extends Failure {
  const SessionFailure({required super.message});

  @override
  List<Object?> get props => [message];
}
