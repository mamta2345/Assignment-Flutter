import 'package:flutter/material.dart';
import 'incoming_call_screen.dart';

class CallScreen extends StatelessWidget {
  final String userId;

  const CallScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final targetUser = userId == 'UserA' ? 'UserB' : 'UserA';

    return Scaffold(
      appBar: AppBar(title: Text('Logged in as $userId')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.video_call),
          label: Text("Call $targetUser"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => IncomingCallScreen(callerId: userId),
              ),
            );
          },
        ),
      ),
    );
  }
}
