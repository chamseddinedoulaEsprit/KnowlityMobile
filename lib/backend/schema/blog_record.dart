import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogRecord extends FirestoreRecord {
  BlogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "mainImage" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _author = snapshotData['author'] as String?;
    _content = snapshotData['content'] as String?;
    _mainImage = snapshotData['mainImage'] as String?;
    _title = snapshotData['title'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blog');

  static Stream<BlogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlogRecord.fromSnapshot(s));

  static Future<BlogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlogRecord.fromSnapshot(s));

  static BlogRecord fromSnapshot(DocumentSnapshot snapshot) => BlogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlogRecordData({
  String? author,
  String? content,
  String? mainImage,
  String? title,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'content': content,
      'mainImage': mainImage,
      'title': title,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlogRecordDocumentEquality implements Equality<BlogRecord> {
  const BlogRecordDocumentEquality();

  @override
  bool equals(BlogRecord? e1, BlogRecord? e2) {
    return e1?.author == e2?.author &&
        e1?.content == e2?.content &&
        e1?.mainImage == e2?.mainImage &&
        e1?.title == e2?.title &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(BlogRecord? e) => const ListEquality()
      .hash([e?.author, e?.content, e?.mainImage, e?.title, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is BlogRecord;
}
