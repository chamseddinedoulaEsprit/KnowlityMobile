import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponsesRecord extends FirestoreRecord {
  ResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Response" field.
  int? _iDResponse;
  int get iDResponse => _iDResponse ?? 0;
  bool hasIDResponse() => _iDResponse != null;

  // "Question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "Response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  // "UserReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  void _initializeFields() {
    _iDResponse = castToType<int>(snapshotData['ID_Response']);
    _question = snapshotData['Question'] as String?;
    _response = snapshotData['Response'] as String?;
    _userReference = snapshotData['UserReference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('responses');

  static Stream<ResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResponsesRecord.fromSnapshot(s));

  static Future<ResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResponsesRecord.fromSnapshot(s));

  static ResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResponsesRecordData({
  int? iDResponse,
  String? question,
  String? response,
  DocumentReference? userReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Response': iDResponse,
      'Question': question,
      'Response': response,
      'UserReference': userReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResponsesRecordDocumentEquality implements Equality<ResponsesRecord> {
  const ResponsesRecordDocumentEquality();

  @override
  bool equals(ResponsesRecord? e1, ResponsesRecord? e2) {
    return e1?.iDResponse == e2?.iDResponse &&
        e1?.question == e2?.question &&
        e1?.response == e2?.response &&
        e1?.userReference == e2?.userReference;
  }

  @override
  int hash(ResponsesRecord? e) => const ListEquality()
      .hash([e?.iDResponse, e?.question, e?.response, e?.userReference]);

  @override
  bool isValidKey(Object? o) => o is ResponsesRecord;
}
