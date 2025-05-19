// lib/Screens/video_call_screen.dart

import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  final String channelName;

  const VideoCallScreen({Key? key, required this.channelName})
    : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool muted = false;
  bool frontCamera = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Simulated Remote Video Feed
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[900],
            child: const Center(
              child: Text(
                'Remote Video',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

          // Simulated Local Video Preview (small box)
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Text(
                  'Local Video',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          // Control Buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: muted ? Colors.red : Colors.blue,
                  onPressed: () {
                    setState(() {
                      muted = !muted;
                    });
                  },
                  child: Icon(muted ? Icons.mic_off : Icons.mic),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Colors.red,
                  onPressed: () {
                    Navigator.pop(context); // End call
                  },
                  child: const Icon(Icons.call_end),
                ),
                FloatingActionButton(
                  heroTag: "btn3",
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    setState(() {
                      frontCamera = !frontCamera;
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
