import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/network/dio_consumer.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';
import 'package:flutter_application_2/core/services/secure_storage_impl.dart';
import 'package:flutter_application_2/features/Auth/data/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(),
  );

  locator.registerLazySingleton<IApiConsumer>(
    () => DioConsumer(locator<Dio>()),
  );
  locator.registerLazySingleton<SecureStorageImpl>(
    () => SecureStorageImpl(locator<FlutterSecureStorage>()),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepository(locator<IApiConsumer>(), locator<SecureStorageImpl>()),
  );
}
