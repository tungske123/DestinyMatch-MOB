import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chats_app/screens/home_screen.dart';
import 'package:flutter_chats_app/screens/start_screen.dart';
import 'package:flutter_chats_app/services/AccountService.dart';
import 'package:flutter_chats_app/services/FirebaseApi.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseApi firebaseApi = FirebaseApi();
  await firebaseApi.initPermission();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Accountservice _accountservice = Accountservice();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: FutureBuilder<bool>(
            future: _accountservice.isLoggedIn(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Show a loading indicator while checking
              } else {
                if (snapshot.data == true) {
                  return const HomeScreen(); // Navigate to HomeScreen if logged in
                } else {
                  return const StartScreen(); // Navigate to LoginScreen if not logged in
                }
              }
            }));
  }
}
