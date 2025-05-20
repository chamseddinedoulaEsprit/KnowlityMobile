import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionRecord extends FirestoreRecord {
  QuestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "testid" field.
  DocumentReference? _testid;
  DocumentReference? get testid => _testid;
  bool hasTestid() => _testid != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "maxscore" field.
  double? _maxscore;
  double get maxscore => _maxscore ?? 0.0;
  bool hasMaxscore() => _maxscore != null;

  // "imagesquestion" field.
  String? _imagesquestion;
  String get imagesquestion => _imagesquestion ?? '';
  bool hasImagesquestion() => _imagesquestion != null;

  void _initializeFields() {
    _testid = snapshotData['testid'] as DocumentReference?;
    _question = snapshotData['question'] as String?;
    _titre = snapshotData['titre'] as String?;
    _maxscore = castToType<double>(snapshotData['maxscore']);
    _imagesquestion = snapshotData['imagesquestion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question');

  static Stream<QuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionRecord.fromSnapshot(s));

  static Future<QuestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionRecord.fromSnapshot(s));

  static QuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionRecordData({
  DocumentReference? testid,
  String? question,
  String? titre,
  double? maxscore,
  String? imagesquestion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'testid': testid,
      'question': question,
      'titre': titre,
      'maxscore': maxscore,
      'imagesquestion': imagesquestion,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionRecordDocumentEquality implements Equality<QuestionRecord> {
  const QuestionRecordDocumentEquality();

  @override
  bool equals(QuestionRecord? e1, QuestionRecord? e2) {
    return e1?.testid == e2?.testid &&
        e1?.question == e2?.question &&
        e1?.titre == e2?.titre &&
        e1?.maxscore == e2?.maxscore &&
        e1?.imagesquestion == e2?.imagesquestion;
  }

  @override
  int hash(QuestionRecord? e) => const ListEquality()
      .hash([e?.testid, e?.question, e?.titre, e?.maxscore, e?.imagesquestion]);

  @override
  bool isValidKey(Object? o) => o is QuestionRecord;
}
