import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/auth/authencation/auth_checker.dart';
import 'package:instinfo/auth/login_signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDBIE8clcC3Jm5y7tnSICxH9dNQ5P48Ubk",
        authDomain: "institution-info.firebaseapp.com",
        projectId: "institution-info",
        storageBucket: "institution-info.appspot.com",
        messagingSenderId: "516654264745",
        appId: "1:516654264745:web:50bf35668f69cfaeda94b8",
        measurementId: "G-Q3DD69H2V3"),
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
          primarySwatch: Colors.blue,
        ),
        home: const AuthChecker() // LoginSignUpScreen(),
        );
  }
}
// create textbox
