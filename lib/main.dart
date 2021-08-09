import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chef/constants.dart';
import 'package:my_chef/models/mid_nav_bar.dart';
import 'package:my_chef/models/navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_chef/screens/home_screen.dart';
import 'package:my_chef/screens/login_screen.dart';
import 'package:my_chef/screens/register_screen.dart';
import 'package:my_chef/screens/verify_screen.dart';
import 'package:provider/provider.dart';

// main() {
Future<void> main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  //

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
      initialRoute: '/login',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/verify': (context) => VerifyScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
