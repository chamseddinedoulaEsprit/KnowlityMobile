// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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

Future<double> noterReponse(
    String question, String reponse, double maxScore) async {
  try {
    final apiKey = '<VOTRE_CLE_API_OPENROUTER>'; // TODO: remplacer
    final response = await http.post(
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
                "Tu es un correcteur. Note uniquement la réponse sur 10 selon sa justesse à la question. Réponds uniquement par un nombre, sans mot ni phrase."
          },
          {
            'role': 'user',
            'content': "Question : $question\nRéponse : $reponse\nNote ?"
          }
        ]
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = json.decode(response.body);
      final noteStr = data['choices']?[0]?['message']?['content']?.toString() ?? '';

      // Essaye d'extraire un nombre entre 0 et 10
      final match = RegExp(r'(\d+(\.\d+)?)').firstMatch(noteStr ?? '');
      final noteSur10 = double.tryParse(match?.group(0) ?? '0') ?? 0.0;

      // Convertit la note sur 10 en note sur maxScore
      final noteFinale = (noteSur10 / 10) * maxScore;

      return double.parse(noteFinale.toStringAsFixed(2)); // Note finale sur maxScore
    }

    // Si l'API échoue, retourne 0 par défaut (ou adapter selon besoin)
    return 0.0;
  } catch (e) {
    print('noterReponse exception: $e');
    return 0.0;
  }
}
