abstract class HiveServiceInterface {
  Future<void> init();
  void setAppThemeMode({required bool isDarkMode});
  void setAppLanguage({required String languageCode});
}
