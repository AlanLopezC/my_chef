import 'package:flutter/material.dart';
import 'package:my_chef/constants.dart';
import 'package:my_chef/models/mid_nav_bar.dart';
import 'package:my_chef/models/navigation.dart';
import 'package:my_chef/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Navigation(),
        ),
        ChangeNotifierProvider(
          create: (context) => MidNavBar(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primarySwatch: kPrimaryColor,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
