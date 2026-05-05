import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/core/data/data_source/app_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final SharedPreferences preferences;
  AppLocalDataSourceImpl(this.preferences);

  @override
  bool isFirstTime() {
    return preferences.getBool(StorageKeys.firstTimer) ?? true;
  }

  @override
  Future<void> cacheFirstTimer(bool isFirstTime) async {
    await preferences.setBool(StorageKeys.firstTimer, isFirstTime);
  }
}
