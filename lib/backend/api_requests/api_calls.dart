import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ImageuploadCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? images,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'imageupload',
      apiUrl:
          'https://api.imgbb.com/1/upload?key=',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': images,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ShareOnFacebookCall {
  static Future<ApiCallResponse> call({
    String? message = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ShareOnFacebook',
      apiUrl: 'https://graph.facebook.com/v22.0//feed',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'message': message,
        'access_token':
            "",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GroqApiKeyCall {
  static Future<ApiCallResponse> call({
    String? text = 'hello , i love bmw',
    String? username = 'rahmani',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "llama3-70b-8192",
  "messages": [
    {
      "role": "system",
      "content": "You are an AI assistant for Knowlity. This mobile application is about online education.Your job is to help users navigate and understand its features.The user's name ${escapeStringForJson(username)} is Additional Notes:- If the user needs help with courses, guide them on enrollment, pricing, or available subjects.- If the user asks about events, provide details about schedules, participation, and deadlines.- If they ask unrelated questions, you can provide general knowledge, but always prioritize website-related queries."
    },
    {
      "role": "user",
      "content": "${escapeStringForJson(text)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'groq api key',
      apiUrl: 'https://api.groq.com/openai/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer ',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? aireponse(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[0].message.content''',
      ));
}

class HuggingFaceScheduleCall {
  static Future<ApiCallResponse> call({
    String? inputs = '',
  }) async {
    final ffApiRequestBody = '''
{
  "inputs": "${escapeStringForJson(inputs)}",
 "parameters": {
    "max_new_tokens": 800,
    "temperature": 0.3,
    "return_full_text": false
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'HuggingFaceSchedule',
      apiUrl:
          'https://api-inference.huggingface.co/models/mistralai/Mixtral-8x7B-Instruct-v0.1',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MailingCall {
  static Future<ApiCallResponse> call({
    String? fichier = '',
  }) async {
    final ffApiRequestBody = '''
{
  "from": "onboarding@resend.dev",
  "to": "chamseddinedoula7@gmail.com",
  "subject": "VOTRE PLANNING POUR LES 4 PROCHAINES SEMAINES",
  "html": "<p>Congrats on sending your <strong>first email</strong>!</p>",
  "attachments": [
    {
      "filename": "planning.pdf",
      "content": "${escapeStringForJson(fichier)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mailing',
      apiUrl: 'https://api.resend.com/emails',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EventDescriptionCall {
  static Future<ApiCallResponse> call({
    String? title = '',
    String? location = '',
    String? category = '',
    String? startdate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "llama3-70b-8192",
  "messages": [
    {
      "role": "user",
      "content": "I want you to generate a description for an event using the following information:\\n- Title: ${escapeStringForJson(title)}\\n- Location: ${escapeStringForJson(location)}\\n- Category: ${escapeStringForJson(category)}\\n- Start date: ${escapeStringForJson(startdate)}\\n\\nThe description must not exceed 300 characters. The text will be used directly as the event description, so do not include any conversational or introductory lines , like:Here is a possible event description:."
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'eventDescription',
      apiUrl: 'https://api.groq.com/openai/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer ',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? generatedDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[0].message.content''',
      ));
}

class HintQuizCall {
  static Future<ApiCallResponse> call({
    String? question = '',
    String? answer1 = '',
    String? answer2 = '',
    String? answer3 = '',
    String? answer4 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "llama3-70b-8192",
  "messages": [
    {
      "role": "user",
      "content": "i will give a question from a quiz and i want you to give me a small hint :-question: ${escapeStringForJson(question)}. just write the hint without any explaination and without any any conversational or introductory lines "
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'hint quiz',
      apiUrl: 'https://api.groq.com/openai/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer ',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? quizhint(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[0].message.content''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
