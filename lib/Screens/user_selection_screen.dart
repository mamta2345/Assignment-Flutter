import 'package:flutter/material.dart';
import 'call_screen.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select User')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CallScreen(userId: 'UserA'),
                  ),
                );
              },
              child: const Text("Login as User A"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CallScreen(userId: 'UserB'),
                  ),
                );
              },
              child: const Text("Login as User B"),
            ),
          ],
        ),
      ),
    );
  }
}
