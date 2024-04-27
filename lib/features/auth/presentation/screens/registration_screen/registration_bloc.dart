import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_test/features/auth/domain/usecases/register_usecase.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/registration_screen/registration_event.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/registration_screen/registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUsecase registerUsecase;
  RegistrationBloc({required this.registerUsecase})
      : super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) async {
      emit(RegistrationLoading());
      final responce = await registerUsecase.call(RegisterParams(
          userName: event.userName,
          password: event.password,
          email: event.email,
          gender: event.gender));
      responce.fold((l) => emit(RegistrationError(message: l.message)),
          (r) => emit(RegistrationLoaded(message: r)));
    });
  }
}
