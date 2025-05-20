import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDVK065z98TDjmbrf03McrVPAgS8Es-6GU",
            authDomain: "knowlity-p1xygw.firebaseapp.com",
            projectId: "knowlity-p1xygw",
            storageBucket: "knowlity-p1xygw.firebasestorage.app",
            messagingSenderId: "90026882910",
            appId: "1:90026882910:web:0657d200f4a89c6e1681cf"));
  } else {
    await Firebase.initializeApp();
  }
}
