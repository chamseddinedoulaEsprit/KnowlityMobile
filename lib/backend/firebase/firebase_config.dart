import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
  // Remplacez ces valeurs par celles de votre projet Firebase.
  // Pour la production, chargez-les depuis un stockage sécurisé ou variables d'environnement.
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "<VOTRE_API_KEY_FIREBASE>",
      authDomain: "knowlity-p1xygw.firebaseapp.com",
      projectId: "knowlity-p1xygw",
      storageBucket: "knowlity-p1xygw.firebasestorage.app",
      messagingSenderId: "90026882910",
      appId: "1:90026882910:web:0657d200f4a89c6e1681cf"));
  } else {
    await Firebase.initializeApp();
  }
}
