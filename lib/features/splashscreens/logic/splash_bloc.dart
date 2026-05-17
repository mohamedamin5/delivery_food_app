import 'package:flutter_application_2/core/bloc/blocs_imports.dart';
import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/core/data/data_source/app_local_data_source_impl.dart';
import 'package:flutter_application_2/core/utils/jwt_hleper.dart';
import 'package:flutter_application_2/core/data/data_source/secure_storage_data_source.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_event.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_state.dart';

//user
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppLocalDataSourceImpl _appLocalDataSourceImpl;
  final SecureStorageDataSource _storage;
  final JwtService jwt = JwtService();
  SplashBloc(this._storage, this._appLocalDataSourceImpl)
    : super(SplashInitial()) {
    on<AppStarted>((event, emit) async {
      if (_appLocalDataSourceImpl.isFirstTime()) {
        emit(FirstTimeUsage());
      } else {
        final accessToken = await _storage.read(StorageKeys.accessToken);
        if (accessToken == null) {
          emit(Unauthenticated());
        } else {
          emit(Authenticated());
        }
      }
    });
  }
}
