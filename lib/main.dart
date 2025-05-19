import 'package:assignment_flutter/Screens/user_selection_screen.dart';
import 'package:assignment_flutter/message.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDmQ5ePfB0evzTgdOsK2ItEdalZPArWmbw",
        authDomain: "flutter-assignment-88831.firebaseapp.com",
        projectId: "flutter-assignment-88831",
        storageBucket: "flutter-assignment-88831.firebasestorage.app",
        messagingSenderId: "616727365591",
        appId: "1:616727365591:web:2b00e1a6f4831fc5c9ad92",
        measurementId: "G-7CGD3D4M1W",
      ),
    ); // Initialize Firebase for web
  } else {
    await Firebase.initializeApp();
    await Firesbaseapi().initNotification(); // Initialize Firebase for mobile
  }

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
