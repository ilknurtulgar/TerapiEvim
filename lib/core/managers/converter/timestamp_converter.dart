import 'package:cloud_firestore/cloud_firestore.dart';

class TimeStampConverter{

  static Timestamp? timestampFromJson(Timestamp? timestamp) {
    return timestamp;
  }

  static Timestamp? timestampToJson(Timestamp? timestamp) {
    return timestamp != null
        ? Timestamp.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch)
        : null;
  }
}