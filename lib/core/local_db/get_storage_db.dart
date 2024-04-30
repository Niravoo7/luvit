import 'package:get_storage/get_storage.dart';
import 'package:luvit/core/constants/string_constants.dart';

class LocalCache {
  final GetStorage _localCacheBox = GetStorage(StorageString.strLocalCacheBox);

  GetStorage get localCacheBox => _localCacheBox;

  Future<void> getStorageInit() async {
    await GetStorage.init();
  }

  Future<void> setBool(String key, bool value) =>
      localCacheBox.write(key, value);

  bool getBool(String key) => localCacheBox.read(key) ?? false;

  Future<void> setInt(String key, int value) => localCacheBox.write(key, value);

  int? getInt(String key) => localCacheBox.read(key);


  Future<void> setString(String key, String value) =>
      localCacheBox.write(key, value);

  String getString(String key) => localCacheBox.read(key) ?? '';

  void removeAllData() {
    removeData(Preferences.isInAppReviewShow);
    removeData(Preferences.isReminderOn);
    removeData(Preferences.reminderDateTime);
  }

  Future<void> removeData(String key) => localCacheBox.remove(key);
}

class Preferences {
  // Non Deletable(Persistent)
  static const isDarkMode = "isDarkMode";
  static const language = "language";
  static const isOnBoardingCompleted = "isOnBoardingCompleted";

  // Deletable
  static const isInAppReviewShow = "isInAppReviewShow";
  static const isReminderOn = "isReminderOn";
  static const reminderDateTime = "reminderDateTime";

  //Favourite
  static const favouriteInLocal = "favouriteInLocal";
}
