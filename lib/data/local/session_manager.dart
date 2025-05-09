import 'package:taza/taza.dart';

/// Storage manager to store and retrieve data from local storage
class StorageManager {
  static final StorageManager instance = StorageManager._internal();

  factory StorageManager() {
    return instance;
  }

  StorageManager._internal();

  static const String _authToken = 'auth_token';
  static const String _themeData = 'themeData';
  static const String _userData = 'userData';
  static const String _userIds = 'userIds';
  static const String _userLanguage = 'userLanguage';
  static const String _isInitialLogin = 'initialLogin';
  static const String _isLogin = 'login';
  static const String _showOfferPopup = 'showOfferPopup';
  static const String _pastSearchesKey = 'past_searches';

  GetStorage localStorage = GetStorage();

  void showOfferPopup(bool value) {
    localStorage.write(_showOfferPopup, value);
  }

  bool isShowOfferPopup() {
    return localStorage.read(_showOfferPopup) ?? false;
  }

  void savePastSearches(List<String> searches) {
    localStorage.write(_pastSearchesKey, searches);
  }

  List<String> getPastSearches() {
    return List<String>.from(localStorage.read(_pastSearchesKey) ?? []);
  }

  void setInitialLoginDone(bool value) {
    localStorage.write(_isInitialLogin, value);
  }

  bool isInitialLoginDone() {
    return localStorage.read(_isInitialLogin) ?? false;
  }

  void setLoginDone(bool value) {
    localStorage.write(_isLogin, value);
  }

  bool isLoginDone() {
    return localStorage.read(_isLogin) ?? false;
  }

  /// Set auth token after login-signup
  void setAuthToken(String token) {
    localStorage.write(_authToken, token);
  }

  String? getAuthToken() {
    return localStorage.read(_authToken);
  }

  /// Save User details
  void saveUserIds(String sessionToken) {
    localStorage.write(_userIds, sessionToken);
  }

  String? getUserIds() {
    return localStorage.read(_userIds);
  }

  void saveUserLanguage(String languageCode) {
     localStorage.write(_userLanguage, languageCode);
  }

  String? getUserLanguage() {
    return localStorage.read(_userLanguage);
  }

  /// Save User details
  void removeUserIds() {
    localStorage.remove(_userIds);
  }

  /// Save User details
  void saveUserDetails(Map<String, dynamic> user){
    localStorage.write(_userData, user);
  }

  Map<String, dynamic>? getUserDetails(){
    return localStorage.read(_userData);
  }

  /// Remove user details
  void removeUserDetails() {
    localStorage.remove(_userData);
  }

  /// Set theme data
  void setTheme(String theme) {
    localStorage.write(_themeData, theme);
  }

  String getTheme() {
    return localStorage.read(_themeData) ?? 'light';
  }

  bool getSystemTheme() {
    //TODO: need to implement
    return true;
  }

  /// Clear all data stored in local
  void clearSession() {
    localStorage.erase();
  }

  void clearPastSearches() {
    localStorage.remove(_pastSearchesKey);
  }


}
