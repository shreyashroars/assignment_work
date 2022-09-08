import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment Work',
      theme: ThemeData(
        textTheme: GoogleFonts.spaceMonoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
