class Config {
  /// It is created to make tests easier to execute
  /// Use it instead of Platform.isAndroid to be able to
  /// where this getter is used
  bool isAndroid = true;

  Config._();

  static Config? _instance;

  static Config get instance => _instance ??= Config._();

  set setIsAndroid(bool value) => isAndroid = value;
}
