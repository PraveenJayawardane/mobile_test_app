class RegistrationEvent {
  final String email;
  final String userName;
  final String gender;
  final String password;

  RegistrationEvent(
      {required this.email,
      required this.userName,
      required this.gender,
      required this.password});
}
