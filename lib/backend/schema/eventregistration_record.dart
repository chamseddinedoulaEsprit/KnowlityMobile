import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventregistrationRecord extends FirestoreRecord {
  EventregistrationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "coming_from" field.
  String? _comingFrom;
  String get comingFrom => _comingFrom ?? '';
  bool hasComingFrom() => _comingFrom != null;

  // "seats" field.
  int? _seats;
  int get seats => _seats ?? 0;
  bool hasSeats() => _seats != null;

  // "eventtitle" field.
  String? _eventtitle;
  String get eventtitle => _eventtitle ?? '';
  bool hasEventtitle() => _eventtitle != null;

  // "registration_date" field.
  DateTime? _registrationDate;
  DateTime? get registrationDate => _registrationDate;
  bool hasRegistrationDate() => _registrationDate != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _event = snapshotData['event'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _comingFrom = snapshotData['coming_from'] as String?;
    _seats = castToType<int>(snapshotData['seats']);
    _eventtitle = snapshotData['eventtitle'] as String?;
    _registrationDate = snapshotData['registration_date'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('eventregistration');

  static Stream<EventregistrationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventregistrationRecord.fromSnapshot(s));

  static Future<EventregistrationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventregistrationRecord.fromSnapshot(s));

  static EventregistrationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventregistrationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventregistrationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventregistrationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventregistrationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventregistrationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventregistrationRecordData({
  DocumentReference? event,
  String? name,
  String? comingFrom,
  int? seats,
  String? eventtitle,
  DateTime? registrationDate,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event': event,
      'name': name,
      'coming_from': comingFrom,
      'seats': seats,
      'eventtitle': eventtitle,
      'registration_date': registrationDate,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventregistrationRecordDocumentEquality
    implements Equality<EventregistrationRecord> {
  const EventregistrationRecordDocumentEquality();

  @override
  bool equals(EventregistrationRecord? e1, EventregistrationRecord? e2) {
    return e1?.event == e2?.event &&
        e1?.name == e2?.name &&
        e1?.comingFrom == e2?.comingFrom &&
        e1?.seats == e2?.seats &&
        e1?.eventtitle == e2?.eventtitle &&
        e1?.registrationDate == e2?.registrationDate &&
        e1?.user == e2?.user;
  }

  @override
  int hash(EventregistrationRecord? e) => const ListEquality().hash([
        e?.event,
        e?.name,
        e?.comingFrom,
        e?.seats,
        e?.eventtitle,
        e?.registrationDate,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is EventregistrationRecord;
}
