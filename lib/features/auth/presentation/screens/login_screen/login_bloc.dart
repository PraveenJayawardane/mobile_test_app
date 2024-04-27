import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      final responce = await loginUsecase.call(LoginParams(
        password: event.password,
        email: event.email,
      ));
      responce.fold((l) => emit(LoginError(message: l.message)),
          (r) => emit(LoginLoaded(loginEntity: r)));
    });
  }
}
