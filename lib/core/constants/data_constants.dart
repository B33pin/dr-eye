// ignore_for_file: library_private_types_in_public_api

class DataConstants {
  static DataConstants? _instance;
  static DataConstants get instance {
    return _instance ??= DataConstants._init();
  }

  DataConstants._init();

  final _JSONPath jSONPath = _JSONPath();
}

class _JSONPath {
  final String searchLottie = 'search'.toJSON;
  final String data = 'data'.toJSON;
  final String arabicData = 'arabic_data'.toJSON;
}

extension ImagePath on String {
  String get toJSON => 'assets/json/$this.json';
}
