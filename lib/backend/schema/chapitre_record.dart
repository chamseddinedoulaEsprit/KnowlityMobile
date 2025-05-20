import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChapitreRecord extends FirestoreRecord {
  ChapitreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cours_id" field.
  DocumentReference? _coursId;
  DocumentReference? get coursId => _coursId;
  bool hasCoursId() => _coursId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "chap_order" field.
  int? _chapOrder;
  int get chapOrder => _chapOrder ?? 0;
  bool hasChapOrder() => _chapOrder != null;

  // "duree_estimee" field.
  int? _dureeEstimee;
  int get dureeEstimee => _dureeEstimee ?? 0;
  bool hasDureeEstimee() => _dureeEstimee != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "contenu" field.
  String? _contenu;
  String get contenu => _contenu ?? '';
  bool hasContenu() => _contenu != null;

  void _initializeFields() {
    _coursId = snapshotData['cours_id'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _chapOrder = castToType<int>(snapshotData['chap_order']);
    _dureeEstimee = castToType<int>(snapshotData['duree_estimee']);
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _contenu = snapshotData['contenu'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chapitre');

  static Stream<ChapitreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChapitreRecord.fromSnapshot(s));

  static Future<ChapitreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChapitreRecord.fromSnapshot(s));

  static ChapitreRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChapitreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChapitreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChapitreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChapitreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChapitreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChapitreRecordData({
  DocumentReference? coursId,
  String? title,
  int? chapOrder,
  int? dureeEstimee,
  String? description,
  String? image,
  String? contenu,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cours_id': coursId,
      'title': title,
      'chap_order': chapOrder,
      'duree_estimee': dureeEstimee,
      'description': description,
      'image': image,
      'contenu': contenu,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChapitreRecordDocumentEquality implements Equality<ChapitreRecord> {
  const ChapitreRecordDocumentEquality();

  @override
  bool equals(ChapitreRecord? e1, ChapitreRecord? e2) {
    return e1?.coursId == e2?.coursId &&
        e1?.title == e2?.title &&
        e1?.chapOrder == e2?.chapOrder &&
        e1?.dureeEstimee == e2?.dureeEstimee &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.contenu == e2?.contenu;
  }

  @override
  int hash(ChapitreRecord? e) => const ListEquality().hash([
        e?.coursId,
        e?.title,
        e?.chapOrder,
        e?.dureeEstimee,
        e?.description,
        e?.image,
        e?.contenu
      ]);

  @override
  bool isValidKey(Object? o) => o is ChapitreRecord;
}
