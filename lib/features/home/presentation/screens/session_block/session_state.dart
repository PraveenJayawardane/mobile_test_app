import 'package:mobile_app_test/features/lesson/domain/entity/session_entity.dart';

class SessionState {}

class SessionInitial extends SessionState {}

class SessionLoading extends SessionState {}

class SessionLoaded extends SessionState {
  final List<SessionsEntity> sessionEntity;

  SessionLoaded({required this.sessionEntity});
}

class SessionError extends SessionState {
  final String message;

  SessionError({required this.message});
}
