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
  final response = await http.post(
    Uri.parse('https://openrouter.ai/api/v1/chat/completions'),
    headers: {
      'Authorization':
          'Bearer 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',
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

  final data = json.decode(response.body);
  final noteStr = data['choices'][0]['message']['content'].trim();

  // Essaye d'extraire un nombre entre 0 et 10
  final noteSur10 = double.tryParse(
          RegExp(r'(\d+(\.\d+)?)').firstMatch(noteStr)?.group(0) ?? '0') ??
      0;

  // Convertit la note sur 10 en note sur maxScore
  final noteFinale = (noteSur10 / 10) * maxScore;

  return double.parse(
      noteFinale.toStringAsFixed(2)); // Note finale sur maxScore
}
