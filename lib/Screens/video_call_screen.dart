import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  final String channelName;

  const VideoCallScreen({super.key, required this.channelName});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool isMuted = false;
  bool isFrontCamera = true;
  bool inCall = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Simulated Remote Video Feed
          Center(
            child: Text(
              inCall ? 'Remote Video' : 'Call Ended',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          // Simulated Local Video Preview (small box)
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              width: 100,
              height: 150,
              color: Colors.grey,
              child: Center(
                child: Text(
                  isFrontCamera ? 'Front Cam' : 'Back Cam',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          // Bottom control buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Mute button
                FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: isMuted ? Colors.red : Colors.blue,
                  onPressed: () {
                    setState(() {
                      isMuted = !isMuted;
                    });
                  },
                  child: Icon(isMuted ? Icons.mic_off : Icons.mic),
                ),

                // End call
                FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Colors.red,
                  onPressed: () {
                    setState(() {
                      inCall = false;
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pop(context);
                    });
                  },
                  child: const Icon(Icons.call_end),
                ),

                // Switch camera
                FloatingActionButton(
                  heroTag: "btn3",
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    setState(() {
                      isFrontCamera = !isFrontCamera;
                    });
                  },
                  child: const Icon(Icons.cameraswitch),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
