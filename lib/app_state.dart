import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _chatbot = prefs
              .getStringList('ff_chatbot')
              ?.map((x) {
                try {
                  return ChatbotStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _chatbot;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<ChatbotStruct> _chatbot = [];
  List<ChatbotStruct> get chatbot => _chatbot;
  set chatbot(List<ChatbotStruct> value) {
    _chatbot = value;
    prefs.setStringList('ff_chatbot', value.map((x) => x.serialize()).toList());
  }

  void addToChatbot(ChatbotStruct value) {
    chatbot.add(value);
    prefs.setStringList(
        'ff_chatbot', _chatbot.map((x) => x.serialize()).toList());
  }

  void removeFromChatbot(ChatbotStruct value) {
    chatbot.remove(value);
    prefs.setStringList(
        'ff_chatbot', _chatbot.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromChatbot(int index) {
    chatbot.removeAt(index);
    prefs.setStringList(
        'ff_chatbot', _chatbot.map((x) => x.serialize()).toList());
  }

  void updateChatbotAtIndex(
    int index,
    ChatbotStruct Function(ChatbotStruct) updateFn,
  ) {
    chatbot[index] = updateFn(_chatbot[index]);
    prefs.setStringList(
        'ff_chatbot', _chatbot.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInChatbot(int index, ChatbotStruct value) {
    chatbot.insert(index, value);
    prefs.setStringList(
        'ff_chatbot', _chatbot.map((x) => x.serialize()).toList());
  }

  List<String> _images = [];
  List<String> get images => _images;
  set images(List<String> value) {
    _images = value;
  }

  void addToImages(String value) {
    images.add(value);
  }

  void removeFromImages(String value) {
    images.remove(value);
  }

  void removeAtIndexFromImages(int index) {
    images.removeAt(index);
  }

  void updateImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    images[index] = updateFn(_images[index]);
  }

  void insertAtIndexInImages(int index, String value) {
    images.insert(index, value);
  }

  int _completedQuestions = 0;
  int get completedQuestions => _completedQuestions;
  set completedQuestions(int value) {
    _completedQuestions = value;
  }

  int _score = 0;
  int get score => _score;
  set score(int value) {
    _score = value;
  }

  String _promptAppState = 'hello';
  String get promptAppState => _promptAppState;
  set promptAppState(String value) {
    _promptAppState = value;
  }

  bool _searchisactive = false;
  bool get searchisactive => _searchisactive;
  set searchisactive(bool value) {
    _searchisactive = value;
  }

  bool _SearchEventisActive = false;
  bool get SearchEventisActive => _SearchEventisActive;
  set SearchEventisActive(bool value) {
    _SearchEventisActive = value;
  }

  bool _isHintPressed = false;
  bool get isHintPressed => _isHintPressed;
  set isHintPressed(bool value) {
    _isHintPressed = value;
  }

  String _qA = '';
  String get qA => _qA;
  set qA(String value) {
    _qA = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
