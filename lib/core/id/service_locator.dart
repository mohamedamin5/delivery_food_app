import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/data/data_source/app_local_data_source_impl.dart';
import 'package:flutter_application_2/core/network/dio_consumer.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';
import 'package:flutter_application_2/core/data/data_source/secure_storage_data_sourcelmpl.dart';
import 'package:flutter_application_2/features/Auth/data/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(
      aOptions: AndroidOptions(),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.unlocked_this_device,
      ),
    ),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  locator.registerLazySingleton<IApiConsumer>(
    () => DioConsumer(locator<Dio>()),
  );
  locator.registerLazySingleton<SecureStorageDataSourceImpl>(
    () => SecureStorageDataSourceImpl(locator<FlutterSecureStorage>()),
  );
  locator.registerLazySingleton<AppLocalDataSourceImpl>(
    () => AppLocalDataSourceImpl(locator<SharedPreferences>()),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      locator<IApiConsumer>(),
      locator<SecureStorageDataSourceImpl>(),
    ),
  );
}
