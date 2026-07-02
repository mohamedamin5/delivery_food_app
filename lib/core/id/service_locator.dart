import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_2/core/data/data_source/app_local_data_source_impl.dart';
import 'package:flutter_application_2/core/data/data_source/firebase_storage_impl.dart';
import 'package:flutter_application_2/core/network/dio_consumer.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';
import 'package:flutter_application_2/core/data/data_source/secure_storage_data_sourceimpl.dart';
import 'package:flutter_application_2/core/utils/flutter_image_compress_helper.dart';
import 'package:flutter_application_2/features/Auth/Domain/usecases/login_user_case.dart';
import 'package:flutter_application_2/features/Auth/Domain/usecases/logout_use_case.dart';
import 'package:flutter_application_2/features/Auth/Domain/usecases/register_use_case.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source_impl.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_remote_data_source_imp.dart';
import 'package:flutter_application_2/features/Auth/Domain/repositories/auth_repository.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/Domain/cases/get_profile_info_use_case.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/Domain/repositories/eidt_restaurant_profile_repo.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/data/datasource/edit_profile_impl.dart';
import 'package:flutter_application_2/features/add_new_item/Domian/usecases/add_item_use_case.dart';
import 'package:flutter_application_2/features/add_new_item/Domian/usecases/get_all_categories_use_case.dart';
import 'package:flutter_application_2/features/add_new_item/data/datasource/add_item_remote_impl.dart';
import 'package:flutter_application_2/features/add_new_item/Domian/repositories/repository.dart';
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
    () => DioConsumer(locator<Dio>(), locator<AuthLocalDataSourceImpl>()),
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
      locator<ImageCompressorService>(),
      locator<AddItemRemoteImpl>(),
    ),
  );
  locator.registerLazySingleton<AddItemRemoteImpl>(
    () => AddItemRemoteImpl(
      locator<IApiConsumer>(),
      locator<AuthLocalDataSourceImpl>(),
    ),
  );

  locator.registerLazySingleton<LoginUserCase>(
    () => LoginUserCase(locator<AuthRepository>()),
  );
  locator.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(locator<AuthRepository>()),
  );
  locator.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(locator<AuthRepository>()),
  );
  locator.registerLazySingleton<AddItemUseCase>(
    () => AddItemUseCase(
      locator<AuthLocalDataSourceImpl>(),
      locator<AddItemRepository>(),
    ),
  );
  locator.registerLazySingleton<GetAllCategoriesUseCase>(
    () => GetAllCategoriesUseCase(locator<AddItemRepository>()),
  );
  locator.registerLazySingleton<EditProfileImpl>(
    () => EditProfileImpl(
      locator<IApiConsumer>(),
      locator<AuthLocalDataSourceImpl>(),
    ),
  );
  locator.registerLazySingleton<EidtRestaurantProfileRepo>(
    () => EidtRestaurantProfileRepo(locator<EditProfileImpl>()),
  );
  locator.registerLazySingleton<GetProfileInfoUseCase>(
    () => GetProfileInfoUseCase(locator<EidtRestaurantProfileRepo>()),
  );
}
