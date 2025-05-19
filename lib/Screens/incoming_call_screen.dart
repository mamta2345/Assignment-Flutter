import 'package:flutter/material.dart';
import 'video_call_screen.dart';

class IncomingCallScreen extends StatelessWidget {
  final String callerId;

  const IncomingCallScreen({super.key, required this.callerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Incoming Video Call", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 12),
            Text("From $callerId", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(Icons.call_end),
                ),
                const SizedBox(width: 40),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => const VideoCallScreen(
                              channelName: 'demo_channel',
                            ),
                      ),
                    );
                  },
                  child: const Icon(Icons.call),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
