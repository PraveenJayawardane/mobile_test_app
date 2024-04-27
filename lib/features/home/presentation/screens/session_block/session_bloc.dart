import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lesson/domain/usecase/get_all_session_usecase.dart';
import 'session_event.dart';
import 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final GetAllSessionUsecase getAllSessionUsecase;
  SessionBloc({required this.getAllSessionUsecase}) : super(SessionInitial()) {
    on<SessionEvent>((event, emit) async {
      emit(SessionLoading());
      final responce = await getAllSessionUsecase.call(SessionParams());
      responce.fold((l) => emit(SessionError(message: l.message)),
          (r) => emit(SessionLoaded(sessionEntity: r)));
    });
  }
}
