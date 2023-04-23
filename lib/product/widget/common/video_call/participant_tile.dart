import 'package:flutter/material.dart';
import 'package:videosdk/videosdk.dart';

class ParticipantTile extends StatelessWidget {
  final Stream stream;

  const ParticipantTile({
    Key? key,
    required this.stream,
    this.hasPadding = true,
  }) : super(key: key);
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasPadding ? const EdgeInsets.all(16) : const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 140,
          width: 100,
          child: RTCVideoView(
            stream.renderer!,
            objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          ),
        ),
      ),
    );
  }
}

class ParticipantTile2 extends StatelessWidget {
  const ParticipantTile2({
    Key? key,
    required this.stream,
    this.hasPadding = true,
  }) : super(key: key);

  final bool hasPadding;
  final Stream stream;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasPadding ? const EdgeInsets.all(16) : const EdgeInsets.all(0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 140,
              width: 100,
              child: RTCVideoView(
                stream.renderer!,
                objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'YT.Yasemin \nAtmaca',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
