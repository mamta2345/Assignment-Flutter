import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallScreen extends StatefulWidget {
  final String channelName;

  const VideoCallScreen({super.key, required this.channelName});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late RtcEngine engine;
  int? remoteUid;
  bool muted = false;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    await [Permission.camera, Permission.microphone].request();

    engine = createAgoraRtcEngine();
    await engine.initialize(
      RtcEngineContext(appId: "YOUR_AGORA_APP_ID"),
    ); // Replace with your Agora App ID
    await engine.enableVideo();
    await engine.startPreview();

    engine.registerEventHandler(
      RtcEngineEventHandler(
        onUserJoined: (connection, uid, elapsed) {
          setState(() => remoteUid = uid);
        },
        onUserOffline: (connection, uid, reason) {
          setState(() => remoteUid = null);
        },
      ),
    );

    await engine.joinChannel(
      token: "YOUR_TEMP_TOKEN", // Replace with token (or "" if not using)
      channelId: widget.channelName,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  void dispose() {
    engine.leaveChannel();
    engine.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          remoteUid != null
              ? AgoraVideoView(
                controller: VideoViewController.remote(
                  // engine: engine,
                  // uid: remoteUid!,
                  // channelId: widget.channelName,
                  rtcEngine: engine,
                  canvas: const VideoCanvas(),
                  connection: RtcConnection(
                    channelId: widget.channelName,
                    localUid: 0,
                  ),
                ),
              )
              : const Center(child: Text("Waiting for other user...")),
          Positioned(
            top: 40,
            left: 20,
            child: SizedBox(
              width: 120,
              height: 160,
              child: AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: engine,
                  canvas: const VideoCanvas(uid: 0),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(muted ? Icons.mic_off : Icons.mic),
                    onPressed: () {
                      engine.muteLocalAudioStream(!muted);
                      setState(() => muted = !muted);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.call_end, color: Colors.red),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.switch_camera),
                    onPressed: () => engine.switchCamera(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
