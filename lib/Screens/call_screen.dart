import 'package:flutter/material.dart';
import 'incoming_call_screen.dart';

class CallScreen extends StatelessWidget {
  final String userId;

  const CallScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    String targetUser = userId == 'UserA' ? 'UserB' : 'UserA';
    return Scaffold(
      appBar: AppBar(title: Text('Welcome $userId')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.video_call),
              label: Text('Call $targetUser'),
              onPressed: () {
                // Simulate incoming call for demo
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => IncomingCallScreen(callerId: userId)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
