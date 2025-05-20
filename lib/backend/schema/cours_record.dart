import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursRecord extends FirestoreRecord {
  CoursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "enseignant" field.
  String? _enseignant;
  String get enseignant => _enseignant ?? '';
  bool hasEnseignant() => _enseignant != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _enseignant = snapshotData['enseignant'] as String?;
    _description = snapshotData['description'] as String?;
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cours');

  static Stream<CoursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursRecord.fromSnapshot(s));

  static Future<CoursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursRecord.fromSnapshot(s));

  static CoursRecord fromSnapshot(DocumentSnapshot snapshot) => CoursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursRecordData({
  String? image,
  String? enseignant,
  String? description,
  String? name,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'enseignant': enseignant,
      'description': description,
      'name': name,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursRecordDocumentEquality implements Equality<CoursRecord> {
  const CoursRecordDocumentEquality();

  @override
  bool equals(CoursRecord? e1, CoursRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.enseignant == e2?.enseignant &&
        e1?.description == e2?.description &&
        e1?.name == e2?.name &&
        e1?.price == e2?.price;
  }

  @override
  int hash(CoursRecord? e) => const ListEquality()
      .hash([e?.image, e?.enseignant, e?.description, e?.name, e?.price]);

  @override
  bool isValidKey(Object? o) => o is CoursRecord;
}
