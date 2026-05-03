import 'package:flutter_application_2/blocs_imports.dart';
import 'package:flutter_application_2/features/Auth/data/auth_repository.dart';
import 'package:flutter_application_2/features/Auth/logic/aut_event.dart';
import 'package:flutter_application_2/features/Auth/logic/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await authRepository.login(
          event.email,
          event.password,
        );
        emit(AuthSeccess(response.toString()));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await authRepository.register(
          event.email,
          event.password,
          event.username,
          event.phone,
        );
        emit(AuthSeccess(response.toString()));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
