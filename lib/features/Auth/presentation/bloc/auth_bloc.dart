import 'package:flutter_application_2/core/bloc/blocs_imports.dart';

import 'package:flutter_application_2/features/Auth/Domain/usecases/login_user_case.dart';
import 'package:flutter_application_2/features/Auth/Domain/usecases/logout_use_case.dart';
import 'package:flutter_application_2/features/Auth/Domain/usecases/register_use_case.dart';
import 'package:flutter_application_2/features/Auth/presentation/bloc/aut_event.dart';
import 'package:flutter_application_2/features/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserCase authRepository;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc(this.authRepository, this.registerUseCase, this._logoutUseCase)
    : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await authRepository.login(
          email: event.email,
          password: event.password,
        );

        response.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (authEntity) => emit(
            AuthSeccess(
              role: authEntity.role == 'customer'
                  ? UserRole.customer
                  : UserRole.chef,
            ),
          ),
        );
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await registerUseCase.register(
          email: event.email,
          password: event.password,
          name: event.username,
          phone: event.phoneNumber,
        );
        response.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (authEntity) => emit(
            AuthSeccess(
              role: authEntity.role == 'customer'
                  ? UserRole.customer
                  : UserRole.chef,
            ),
          ),
        );
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await _logoutUseCase.logout();
      emit(AuthInitial());
    });
  }
}
