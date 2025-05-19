import 'package:flutter/material.dart';
import 'video_call_screen.dart';

class IncomingCallScreen extends StatelessWidget {
  final String callerId;

  const IncomingCallScreen({super.key, required this.callerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Incoming Call", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text("From $callerId", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "decline",
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.call_end),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 50),
                FloatingActionButton(
                  heroTag: "accept",
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.call),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const VideoCallScreen(channelName: 'demo_channel')),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
