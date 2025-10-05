// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

/// Filtre un texte en remplaçant les mots offensants par des étoiles via OpenRouter API.
/// IMPORTANT: Ne laissez pas de clés API en dur ici. Utilisez des variables d'environnement
/// ou la configuration Firebase/Secret Manager. Cette fonction retourne une chaîne
/// filtrée ou la chaîne d'origine en cas d'erreur.
Future<String> filtrerAvecGPT(String texte) async {
  try {
    // Récupérez la clé depuis une source sécurisée; placeholder ci-dessous:
    final apiKey = '<VOTRE_CLE_API_OPENROUTER>'; // TODO: remplacer

    final r = await http.post(
      Uri.parse('https://openrouter.ai/api/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'openai/gpt-3.5-turbo',
        'messages': [
          {
            'role': 'system',
            'content':
                "Censure tous les mots vulgaires ou offensants avec des étoiles (*). Ne change rien d'autre dans le texte."
          },
          {'role': 'user', 'content': texte}
        ]
      }),
    );

    if (r.statusCode >= 200 && r.statusCode < 300) {
      final data = json.decode(r.body) as Map<String, dynamic>;
      final content = data['choices']?[0]?['message']?['content'];
      if (content is String) return content.trim();
    }

    // En cas d'erreur, retourne le texte d'origine (ou adapter selon besoin)
    return texte;
  } catch (e) {
    print('filtrerAvecGPT error: $e');
    return texte;
  }
}
