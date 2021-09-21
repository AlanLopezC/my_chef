import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/account/new_user/new_user_controller.dart';
import 'package:my_chef/app/screens/home/profile/provider/drawer_controller.dart';
import 'package:my_chef/app/screens/home/widgets/recipe_view.dart';
import 'package:my_chef/data/datasources/firebase_auth_impl.dart';
import 'package:my_chef/data/datasources/firebase_firestore_impl.dart';
import 'package:my_chef/data/services/firebase_storage_impl.dart';
import 'package:my_chef/domain/repositories/auth_repository.dart';
import 'package:my_chef/app/constants.dart';
import 'package:my_chef/app/screens/home/profile/provider/mid_nav_bar.dart';
import 'package:my_chef/app/screens/home/provider/navigation.dart';
import 'package:my_chef/app/screens/account/login/login_controller.dart';
import 'package:my_chef/app/screens/account/register/register_controller.dart';
import 'package:my_chef/app/screens/account/reset_pass/reset_pass_controller.dart';
import 'package:my_chef/app/screens/home/home_nav.dart';
import 'package:my_chef/app/screens/account/verify/verify_controller.dart';
import 'package:my_chef/domain/repositories/database_repository.dart';
import 'package:my_chef/domain/services/storage_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Navigation(),
        ),
        Provider(
          create: (_) => DrawerControllerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MidNavBar(),
        ),
        Provider<AuthRepository>(
          create: (_) => FirebaseAuthImpl(),
        ),
        Provider<DatabaseRepository>(
          create: (_) => FirebaseFirestoreImpl(),
        ),
        Provider<StorageService>(
          create: (_) => FirebaseStorageImpl(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

// ? could create a userModel provider to dont fetch always for his user info
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Chef',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primarySwatch: kPrimaryColor,
      ),
      // ! Check if is loggedin
      initialRoute: '/',
      routes: {
        '/': (context) => HomeNav(),
        '/login': (context) => LoginController(),
        '/register': (context) => RegisterController(),
        '/verify': (context) => VerifyController(),
        '/reset_pass': (context) => ResetPassController(),
        '/new_user': (context) => NewUserController(),
        '/recipe': (context) => RecipeView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
