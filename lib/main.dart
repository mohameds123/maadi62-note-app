import 'package:flutter/material.dart';
import 'package:note_app/presintation/screens/login_screen.dart';
import 'package:note_app/presintation/screens/notes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const NotesScreen(),
    );
  }
}
