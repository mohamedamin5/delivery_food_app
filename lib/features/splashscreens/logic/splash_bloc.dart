import 'package:flutter_application_2/core/bloc/blocs_imports.dart';
import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/core/data/data_source/app_local_data_source_impl.dart';
import 'package:flutter_application_2/core/utils/jwt_hleper.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_event.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_state.dart';

//user
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppLocalDataSourceImpl _appLocalDataSourceImpl;
  final AuthLocalDataSource _authLocalDataSource;
  final JwtService jwt = JwtService();
  SplashBloc(this._authLocalDataSource, this._appLocalDataSourceImpl)
    : super(SplashInitial()) {
    on<AppStarted>((event, emit) async {
      if (_appLocalDataSourceImpl.isFirstTime()) {
        emit(FirstTimeUsage());
      } else {
        final accessToken = await _authLocalDataSource.getAuthData(
          StorageKeys.accessToken,
        );
        final role = await _authLocalDataSource.getAuthData(StorageKeys.role);
        if (accessToken == null) {
          emit(Unauthenticated());
        } else {
          emit(
            Authenticated(
              role: role == 'customer' ? UserRole.customer : UserRole.chef,
            ),
          );
        }
      }
    });
  }
}




// lass UserRole(str, Enum):
//   """User role enumeration for RBAC."""
//   ADMIN = "admin"
//   CUSTOMER = "customer"  # تم التعديل من USER إلى CUSTOMER لرفع اللبس
//   CHEF = "chef"
//   DRIVER = "driver"