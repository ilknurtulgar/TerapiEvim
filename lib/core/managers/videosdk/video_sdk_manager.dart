import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../base/service/base_service.dart';
import 'i_video_sdk_manager.dart';

class VideoSdkManager extends IVideoSdkManager with BaseService {
  final String _token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI4OWU3OTZlZi0wOTMxLTQxZGEtYTlkYi1lMmYyZWE2MjYyOTMiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY3OTk5NzQxMCwiZXhwIjoxNjg3NzczNDEwfQ.J-c2vKSZkWG7C0M8pdEECJ_JbToqnl8vL9TJllUh_lk";

  @override
  String get token => _token;

  @override
  Future<String?> createMeeting() async {
    try {
      final http.Response httpResponse = await http.post(
        Uri.parse("https://api.videosdk.live/v2/rooms"),
        headers: {'Authorization': _token},
      );

      return json.decode(httpResponse.body)['roomId'];
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'VideoSdkManager/createMeeting',
      );
      return null;
    }
  }
}
