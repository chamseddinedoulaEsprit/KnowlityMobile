import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReponseRecord extends FirestoreRecord {
  ReponseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "questionid" field.
  DocumentReference? _questionid;
  DocumentReference? get questionid => _questionid;
  bool hasQuestionid() => _questionid != null;

  // "reponse" field.
  String? _reponse;
  String get reponse => _reponse ?? '';
  bool hasReponse() => _reponse != null;

  // "remarque" field.
  String? _remarque;
  String get remarque => _remarque ?? '';
  bool hasRemarque() => _remarque != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _questionid = snapshotData['questionid'] as DocumentReference?;
    _reponse = snapshotData['reponse'] as String?;
    _remarque = snapshotData['remarque'] as String?;
    _note = snapshotData['note'] as String?;
    _userId = snapshotData['userId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reponse');

  static Stream<ReponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReponseRecord.fromSnapshot(s));

  static Future<ReponseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReponseRecord.fromSnapshot(s));

  static ReponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReponseRecordData({
  DocumentReference? questionid,
  String? reponse,
  String? remarque,
  String? note,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questionid': questionid,
      'reponse': reponse,
      'remarque': remarque,
      'note': note,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReponseRecordDocumentEquality implements Equality<ReponseRecord> {
  const ReponseRecordDocumentEquality();

  @override
  bool equals(ReponseRecord? e1, ReponseRecord? e2) {
    return e1?.questionid == e2?.questionid &&
        e1?.reponse == e2?.reponse &&
        e1?.remarque == e2?.remarque &&
        e1?.note == e2?.note &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(ReponseRecord? e) => const ListEquality()
      .hash([e?.questionid, e?.reponse, e?.remarque, e?.note, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is ReponseRecord;
}
