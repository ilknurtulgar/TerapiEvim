part of 'picker_manager.dart';

abstract class _IPicker {
  Future<String?> pickImage();

  Future<String?> pickPdf();

  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;

}
