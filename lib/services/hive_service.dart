import 'package:app_test/config/hive_constants.dart';
import 'package:app_test/services/interface/hive_service_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService implements HiveServiceInterface {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  HiveService._internal();

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveConstants.userBox);
    await Hive.openBox(HiveConstants.settingsBox);
  }

  @override
  void setAppLanguage({required String languageCode}) {
    final appSettingsBox = Hive.box(HiveConstants.settingsBox);
    appSettingsBox.put(HiveConstants.languageKey, languageCode);
  }

  @override
  void setAppThemeMode({required bool isDarkMode}) {
    final appSettingsBox = Hive.box(HiveConstants.settingsBox);
    appSettingsBox.put(HiveConstants.isDarkModeKey, isDarkMode,);
  }
}
