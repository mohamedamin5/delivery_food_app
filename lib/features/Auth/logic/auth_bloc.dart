import 'package:flutter_application_2/core/bloc/blocs_imports.dart';
import 'package:flutter_application_2/features/Auth/data/repositories/auth_repository.dart';
import 'package:flutter_application_2/features/Auth/logic/aut_event.dart';
import 'package:flutter_application_2/features/Auth/logic/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.login(
          email: event.email,
          password: event.password,
        );
        emit(AuthSeccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.register(
          username: event.username,
          password: event.password,
          email: event.email,
          phone: event.phoneNumber,
        );
        emit(AuthSeccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
