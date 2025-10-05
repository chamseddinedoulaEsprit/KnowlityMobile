// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart'; // Pour kIsWeb
import 'package:http/http.dart' as http; // Pour les requêtes HTTP
import 'dart:convert'; // Pour jsonEncode

/// Fonction pour tester l'envoi d'un email via l'API Resend
Future<bool> sendTestEmail() async {
  // Désactiver l'envoi d'email dans un environnement web
  if (kIsWeb) {
    print('Envoi d\'email désactivé dans l\'environnement web.');
    return false;
  }

  try {
    final response = await http.post(
      Uri.parse('https://api.resend.com/emails'),
      headers: {
        'Authorization': 'Bearer re_VdcPTPAW_85G1gNtYZBzcRSQWepqxdS4M',
        'Content-Type': 'application/json',
      },
      // Automatic FlutterFlow imports
      import '/backend/backend.dart';
      import '/backend/schema/structs/index.dart';
      import '/flutter_flow/flutter_flow_theme.dart';
      import '/flutter_flow/flutter_flow_util.dart';
      import 'index.dart'; // Imports other custom actions
      import 'package:flutter/material.dart';
      // Begin custom action code
      // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

      import 'package:flutter/foundation.dart'; // Pour kIsWeb
      import 'package:http/http.dart' as http; // Pour les requêtes HTTP
      import 'dart:convert'; // Pour jsonEncode

      /// Fonction pour tester l'envoi d'un email via l'API Resend
      Future<bool> sendTestEmail() async {
        // Désactiver l'envoi d'email dans un environnement web
        if (kIsWeb) {
          print('Envoi d\'email désactivé dans l\'environnement web.');
          return false;
        }

        try {
          // Remplacez par une source sécurisée pour récupérer la clé API.
          final apiKey = '<VOTRE_CLE_RESEND>'; // TODO: remplacer

          final response = await http.post(
            Uri.parse('https://api.resend.com/emails'),
            headers: {
              'Authorization': 'Bearer $apiKey',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'from': 'onboarding@resend.dev',
              'to': 'chamseddinedoula7@gmail.com',
              'subject': 'Hello World',
              'html': '<p>Congrats on sending your <strong>first email</strong>!</p>',
            }),
          );

          print('Réponse Resend: ${response.statusCode} - ${response.body}');
          if (response.statusCode == 200 || response.statusCode == 201) {
            return true;
          } else {
            print('Échec de l\'envoi de l\'email: ${response.statusCode} - ${response.body}');
            return false;
          }
        } catch (e) {
          print('Erreur détaillée lors de l\'envoi de l\'email: $e');
          return false;
        }
      }
