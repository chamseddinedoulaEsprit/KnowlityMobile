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

Future<bool> geminiApiBadWords(String text) async {
  // Add your function code here

  final url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyA1esrizXh4EJvldkXp_II946D5yaBGTbE';

  final Map<String, dynamic> requestBody = {
    "contents": [
      {
        "parts": [
          {
            "text":
                "Reply with 'true' if the text contains any bad words or harassment, otherwise reply with 'false'. (always reply with true or false). text : ${text}"
          }
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
    String rep = responseData["candidates"]?[0]["content"]["parts"]?[0]["text"];

    if (rep.contains("true")) {
      return true;
    }

    return false;
  } else {
    print("Error: ${response.statusCode} - ${response.body}");
    return false;
  }
}
