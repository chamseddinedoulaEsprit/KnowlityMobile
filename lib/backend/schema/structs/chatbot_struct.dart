// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatbotStruct extends FFFirebaseStruct {
  ChatbotStruct({
    String? myMessage,
    String? chatMessage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _myMessage = myMessage,
        _chatMessage = chatMessage,
        super(firestoreUtilData);

  // "myMessage" field.
  String? _myMessage;
  String get myMessage => _myMessage ?? '';
  set myMessage(String? val) => _myMessage = val;

  bool hasMyMessage() => _myMessage != null;

  // "chatMessage" field.
  String? _chatMessage;
  String get chatMessage => _chatMessage ?? '';
  set chatMessage(String? val) => _chatMessage = val;

  bool hasChatMessage() => _chatMessage != null;

  static ChatbotStruct fromMap(Map<String, dynamic> data) => ChatbotStruct(
        myMessage: data['myMessage'] as String?,
        chatMessage: data['chatMessage'] as String?,
      );

  static ChatbotStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatbotStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'myMessage': _myMessage,
        'chatMessage': _chatMessage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'myMessage': serializeParam(
          _myMessage,
          ParamType.String,
        ),
        'chatMessage': serializeParam(
          _chatMessage,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatbotStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatbotStruct(
        myMessage: deserializeParam(
          data['myMessage'],
          ParamType.String,
          false,
        ),
        chatMessage: deserializeParam(
          data['chatMessage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatbotStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatbotStruct &&
        myMessage == other.myMessage &&
        chatMessage == other.chatMessage;
  }

  @override
  int get hashCode => const ListEquality().hash([myMessage, chatMessage]);
}

ChatbotStruct createChatbotStruct({
  String? myMessage,
  String? chatMessage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatbotStruct(
      myMessage: myMessage,
      chatMessage: chatMessage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatbotStruct? updateChatbotStruct(
  ChatbotStruct? chatbot, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatbot
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatbotStructData(
  Map<String, dynamic> firestoreData,
  ChatbotStruct? chatbot,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatbot == null) {
    return;
  }
  if (chatbot.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatbot.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatbotData = getChatbotFirestoreData(chatbot, forFieldValue);
  final nestedData = chatbotData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatbot.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatbotFirestoreData(
  ChatbotStruct? chatbot, [
  bool forFieldValue = false,
]) {
  if (chatbot == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatbot.toMap());

  // Add any Firestore field values
  chatbot.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatbotListFirestoreData(
  List<ChatbotStruct>? chatbots,
) =>
    chatbots?.map((e) => getChatbotFirestoreData(e, true)).toList() ?? [];
