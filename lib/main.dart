import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:webpage/mobile/landing_page_mobile.dart';
import 'package:webpage/route.dart';
import 'firebase_options.dart';
// import { initializeApp } from "firebase/app";
// import { getAnalytics } from "firebase/analytics";// Auto-generated file after Firebase CLI configuration

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  if (kIsWeb) {
    // Use web-specific Firebase initialization
    await Firebase.initializeApp(
      options: FirebaseOptions(
          // apiKey: "your-web-api-key", // Add Firebase web API details
          // authDomain: "your-app.firebaseapp.com",
          // projectId: "gayathri-514db",
          // storageBucket: "your-project-id.appspot.com",
          // messagingSenderId: "your-messaging-sender-id",
          // appId: "1:12417387484:web:3d7fcd8ab88ab62dcddd19",
          apiKey: "AIzaSyDOIvB4EvQMVce6-f2HXZzPL6QkkD2pv5M",
          authDomain: "gayathri-514db.firebaseapp.com",
          projectId: "gayathri-514db",
          storageBucket: "gayathri-514db.appspot.com",
          messagingSenderId: "12417387484",
          appId: "1:12417387484:web:3d7fcd8ab88ab62dcddd19",
          measurementId: "G-23022JBBR0"),
    );
  } else {
    // Initialize Firebase for other platforms (iOS, Android)
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: '/',
    );
  }
}
