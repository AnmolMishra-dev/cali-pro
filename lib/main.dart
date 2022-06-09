import 'package:calibrum/constants/constant.dart';
import 'package:calibrum/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calibrum',
      theme: ThemeData(
        primaryColor: headerDarkBG,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Login(),
    );
  }
}
