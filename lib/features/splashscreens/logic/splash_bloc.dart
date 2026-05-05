import 'package:flutter_application_2/blocs_imports.dart';
import 'package:flutter_application_2/core/services/jwt_service.dart';
import 'package:flutter_application_2/core/services/storage_service.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_event.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_state.dart';

//user
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final StorageService _storage;
  final JwtService jwt = JwtService();
  SplashBloc(this._storage) : super(SplashInitial()) {
    on<AppStarted>((event, emit) async {
      final token = await _storage.read("refresh_token");
      if (token == null) {
        emit(Unauthenticated());
      } else {
        final String? role = jwt.getUserRole(token);
        if (jwt.isTokenValid(token) && role == 'user') {
          emit(Authenticated());
        }
      }
    });
  }
}
