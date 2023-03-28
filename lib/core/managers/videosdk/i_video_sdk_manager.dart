abstract class IVideoSdkManager {
  String get token;

  Future<String?> createMeeting();
}
