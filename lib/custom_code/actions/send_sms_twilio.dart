// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendSmsTwilio(String to, String message) async {
  final String accountSid = '';
  final String authToken = '';
  final String twilioNumber = '';

  final String url =
      'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json';

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'To': to,
      'From': twilioNumber,
      'Body': message,
    },
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    print('✅ SMS envoyé avec succès');
  } else {
    print('❌ Erreur: ${response.body}');
  }
}
