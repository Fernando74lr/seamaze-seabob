import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCJSQ7qEIw1ceP3ZbGP69hcy4K_bXtloaQ",
            authDomain: "seamaze-e8bbf.firebaseapp.com",
            projectId: "seamaze-e8bbf",
            storageBucket: "seamaze-e8bbf.appspot.com",
            messagingSenderId: "391446224305",
            appId: "1:391446224305:web:3b1512e918e6b417b8b190",
            measurementId: "G-VBDX7ED190"));
  } else {
    await Firebase.initializeApp();
  }
}
