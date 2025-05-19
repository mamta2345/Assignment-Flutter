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
              child: const Text("Login as User A"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CallScreen(userId: 'UserA'))),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Login as User B"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CallScreen(userId: 'UserB'))),
            ),
          ],
        ),
      ),
    );
  }
}
