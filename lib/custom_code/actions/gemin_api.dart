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

/// Appelle l'API Generative Language (Gemini).
/// IMPORTANT: ne pas laisser la clef en dur ; utilisez une variable d'environnement.
Future<String> geminApi(String text) async {
  try {
    final apiKey = '<VOTRE_CLE_API_GOOGLE>'; // TODO: remplacer
    final url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey';

    final Map<String, dynamic> requestBody = {
      "contents": [
        {
          "parts": [
            {"text": "$text"}
          ]
        }
      ]
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final candidate = responseData["candidates"] is List && responseData["candidates"].isNotEmpty
          ? responseData["candidates"][0]
          : null;
      final textOut = candidate?['content']?['parts']?[0]?['text'];
      if (textOut is String) return textOut;
      return '';
    } else {
      print("geminApi Error: ${response.statusCode} - ${response.body}");
      return '';
    }
  } catch (e) {
    print('geminApi exception: $e');
    return '';
  }
}
