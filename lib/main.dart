import 'package:assignment_flutter/Screens/user_selection_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const VideoCallApp());
}

class VideoCallApp extends StatelessWidget {
  const VideoCallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One-to-One Video Call',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const UserSelectionScreen(),
    );
  }
}
