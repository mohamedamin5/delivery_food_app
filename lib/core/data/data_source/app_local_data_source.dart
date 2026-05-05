abstract class AppLocalDataSource {
  Future<void> cacheFirstTimer(bool isFirstTime);

  bool isFirstTime();
}
