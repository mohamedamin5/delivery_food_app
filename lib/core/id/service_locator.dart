import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_2/core/data/data_source/app_local_data_source_impl.dart';
import 'package:flutter_application_2/core/data/data_source/firebase_storage_impl.dart';
import 'package:flutter_application_2/core/network/dio_consumer.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';
import 'package:flutter_application_2/core/data/data_source/secure_storage_data_sourceimpl.dart';
import 'package:flutter_application_2/core/utils/flutter_image_compress_helper.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source_impl.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_remote_data_source_imp.dart';
import 'package:flutter_application_2/features/Auth/data/repositories/auth_repository.dart';
import 'package:flutter_application_2/features/add_new_item/repositories/repository.dart';
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
  locator.registerLazySingleton<FirebaseStorage>(
    () => FirebaseStorage.instance,
  );

  locator.registerLazySingleton<FirebaseStorageImpl>(
    () => FirebaseStorageImpl(locator<FirebaseStorage>()),
  );
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
      locator<AuthLocalDataSourceImpl>(),
      locator<AuthRemoteDataSourceImp>(),
    ),
  );
  locator.registerLazySingleton<AuthRemoteDataSourceImp>(
    () => AuthRemoteDataSourceImp(locator<IApiConsumer>()),
  );
  locator.registerLazySingleton<AuthLocalDataSourceImpl>(
    () => AuthLocalDataSourceImpl(locator<SecureStorageDataSourceImpl>()),
  );
  locator.registerLazySingleton<ImageCompressorService>(
    () => ImageCompressorService(),
  );
  locator.registerLazySingleton<AddItemRepository>(
    () => AddItemRepository(
      locator<FirebaseStorageImpl>(),
      locator<AuthLocalDataSourceImpl>(),
      locator<ImageCompressorService>(),
    ),
  );
}
