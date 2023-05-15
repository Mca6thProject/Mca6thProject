import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/auth/authencation/auth_checker.dart';
import 'package:instinfo/auth/login_signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

      // options: const FirebaseOptions(
      //     apiKey: "AIzaSyD6dewNdnNUXAswM5OfLZixlLMLz3HHiKI",
      //     authDomain: "mca6projectinfo.firebaseapp.com",
      //     projectId: "mca6projectinfo",
      //     storageBucket: "mca6projectinfo.appspot.com",
      //     messagingSenderId: "1069206495748",
      //     appId: "1:1069206495748:web:5311b41462222603b24b51",
      //     measurementId: "G-GBJS36VFYP"),
      );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nielit Info',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: const AuthChecker() // LoginSignUpScreen(),
        );
  }
}
// create textbox
