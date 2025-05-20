import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EvaluationparetudRecord extends FirestoreRecord {
  EvaluationparetudRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "evaluation" field.
  DocumentReference? _evaluation;
  DocumentReference? get evaluation => _evaluation;
  bool hasEvaluation() => _evaluation != null;

  // "courid" field.
  DocumentReference? _courid;
  DocumentReference? get courid => _courid;
  bool hasCourid() => _courid != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _evaluation = snapshotData['evaluation'] as DocumentReference?;
    _courid = snapshotData['courid'] as DocumentReference?;
    _userId = snapshotData['userId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('evaluationparetud');

  static Stream<EvaluationparetudRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EvaluationparetudRecord.fromSnapshot(s));

  static Future<EvaluationparetudRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EvaluationparetudRecord.fromSnapshot(s));

  static EvaluationparetudRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EvaluationparetudRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EvaluationparetudRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EvaluationparetudRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EvaluationparetudRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EvaluationparetudRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEvaluationparetudRecordData({
  DocumentReference? evaluation,
  DocumentReference? courid,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'evaluation': evaluation,
      'courid': courid,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class EvaluationparetudRecordDocumentEquality
    implements Equality<EvaluationparetudRecord> {
  const EvaluationparetudRecordDocumentEquality();

  @override
  bool equals(EvaluationparetudRecord? e1, EvaluationparetudRecord? e2) {
    return e1?.evaluation == e2?.evaluation &&
        e1?.courid == e2?.courid &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(EvaluationparetudRecord? e) =>
      const ListEquality().hash([e?.evaluation, e?.courid, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is EvaluationparetudRecord;
}
