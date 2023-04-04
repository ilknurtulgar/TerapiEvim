part of 'picker_manager.dart';

abstract class _IPicker {
  Future<PlatformFile?> pickImage();

  Future<PlatformFile?> pickPdf();

  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;

}
