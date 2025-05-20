// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String formatFacebookMessage(String title, String description, String prix,
    String langue, String courseId) {
  const String courseUrlBase =
      "https://votre-site.com/cours/"; // Remplacez par l'URL de votre site
  double prixValue = double.tryParse(prix) ??
      0.0; // Convertit la chaîne en Double, 0.0 si échec
  String prixText = prixValue > 0 ? "$prixValue DT" : "Gratuit";
  return """
🎓 Nouveau cours disponible !

📚 Titre : $title
📝 Description : $description
💵 Prix : $prixText
🌐 Langue : ${langue.toUpperCase()}

👉 Découvrez-le maintenant : ${courseUrlBase + courseId}
""";
}
