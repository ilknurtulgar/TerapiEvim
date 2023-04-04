part of 'picker_manager.dart';

class _Picker extends _IPicker {
  @override
  Future<PlatformFile?> pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      return result.files.single;
    } else {
      // User canceled the picker
      return null;
    }
  }

  @override
  Future<PlatformFile?> pickPdf() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        return result.files.single;
      } else {
        // User canceled the picker
        return null;
      }
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      rethrow;
    }
  }
}
