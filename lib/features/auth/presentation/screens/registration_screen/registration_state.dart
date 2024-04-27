class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationLoaded extends RegistrationState {
  final String message;

  RegistrationLoaded({required this.message});
}

class RegistrationError extends RegistrationState {
  final String message;

  RegistrationError({required this.message});
}
