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

Future<String> filtrerAvecGPT(String texte) async {
  final r = await http.post(
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
              "Censure tous les mots vulgaires ou offensants avec des étoiles (*). Ne change rien d'autre dans le texte."
        },
        {'role': 'user', 'content': texte}
      ]
    }),
  );

  final data = json.decode(r.body);
  return data['choices'][0]['message']['content'].trim();
}
