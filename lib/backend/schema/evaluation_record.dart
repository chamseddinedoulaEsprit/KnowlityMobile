import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EvaluationRecord extends FirestoreRecord {
  EvaluationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "cours" field.
  DocumentReference? _cours;
  DocumentReference? get cours => _cours;
  bool hasCours() => _cours != null;

  // "createat" field.
  DateTime? _createat;
  DateTime? get createat => _createat;
  bool hasCreateat() => _createat != null;

  // "deadline" field.
  DateTime? _deadline;
  DateTime? get deadline => _deadline;
  bool hasDeadline() => _deadline != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _titre = snapshotData['titre'] as String?;
    _cours = snapshotData['cours'] as DocumentReference?;
    _createat = snapshotData['createat'] as DateTime?;
    _deadline = snapshotData['deadline'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('evaluation');

  static Stream<EvaluationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EvaluationRecord.fromSnapshot(s));

  static Future<EvaluationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EvaluationRecord.fromSnapshot(s));

  static EvaluationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EvaluationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EvaluationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EvaluationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EvaluationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EvaluationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEvaluationRecordData({
  String? description,
  String? titre,
  DocumentReference? cours,
  DateTime? createat,
  DateTime? deadline,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'titre': titre,
      'cours': cours,
      'createat': createat,
      'deadline': deadline,
    }.withoutNulls,
  );

  return firestoreData;
}

class EvaluationRecordDocumentEquality implements Equality<EvaluationRecord> {
  const EvaluationRecordDocumentEquality();

  @override
  bool equals(EvaluationRecord? e1, EvaluationRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.titre == e2?.titre &&
        e1?.cours == e2?.cours &&
        e1?.createat == e2?.createat &&
        e1?.deadline == e2?.deadline;
  }

  @override
  int hash(EvaluationRecord? e) => const ListEquality()
      .hash([e?.description, e?.titre, e?.cours, e?.createat, e?.deadline]);

  @override
  bool isValidKey(Object? o) => o is EvaluationRecord;
}
