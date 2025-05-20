// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LevelStruct extends FFFirebaseStruct {
  LevelStruct({
    String? levelName,
    String? levelDesc,
    bool? isLevelLocked,
    String? levelImage,
    double? completionPerc,
    int? levelNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _levelName = levelName,
        _levelDesc = levelDesc,
        _isLevelLocked = isLevelLocked,
        _levelImage = levelImage,
        _completionPerc = completionPerc,
        _levelNumber = levelNumber,
        super(firestoreUtilData);

  // "LevelName" field.
  String? _levelName;
  String get levelName => _levelName ?? '';
  set levelName(String? val) => _levelName = val;

  bool hasLevelName() => _levelName != null;

  // "LevelDesc" field.
  String? _levelDesc;
  String get levelDesc => _levelDesc ?? '';
  set levelDesc(String? val) => _levelDesc = val;

  bool hasLevelDesc() => _levelDesc != null;

  // "isLevelLocked" field.
  bool? _isLevelLocked;
  bool get isLevelLocked => _isLevelLocked ?? false;
  set isLevelLocked(bool? val) => _isLevelLocked = val;

  bool hasIsLevelLocked() => _isLevelLocked != null;

  // "levelImage" field.
  String? _levelImage;
  String get levelImage => _levelImage ?? '';
  set levelImage(String? val) => _levelImage = val;

  bool hasLevelImage() => _levelImage != null;

  // "completionPerc" field.
  double? _completionPerc;
  double get completionPerc => _completionPerc ?? 0.0;
  set completionPerc(double? val) => _completionPerc = val;

  void incrementCompletionPerc(double amount) =>
      completionPerc = completionPerc + amount;

  bool hasCompletionPerc() => _completionPerc != null;

  // "levelNumber" field.
  int? _levelNumber;
  int get levelNumber => _levelNumber ?? 0;
  set levelNumber(int? val) => _levelNumber = val;

  void incrementLevelNumber(int amount) => levelNumber = levelNumber + amount;

  bool hasLevelNumber() => _levelNumber != null;

  static LevelStruct fromMap(Map<String, dynamic> data) => LevelStruct(
        levelName: data['LevelName'] as String?,
        levelDesc: data['LevelDesc'] as String?,
        isLevelLocked: data['isLevelLocked'] as bool?,
        levelImage: data['levelImage'] as String?,
        completionPerc: castToType<double>(data['completionPerc']),
        levelNumber: castToType<int>(data['levelNumber']),
      );

  static LevelStruct? maybeFromMap(dynamic data) =>
      data is Map ? LevelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'LevelName': _levelName,
        'LevelDesc': _levelDesc,
        'isLevelLocked': _isLevelLocked,
        'levelImage': _levelImage,
        'completionPerc': _completionPerc,
        'levelNumber': _levelNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'LevelName': serializeParam(
          _levelName,
          ParamType.String,
        ),
        'LevelDesc': serializeParam(
          _levelDesc,
          ParamType.String,
        ),
        'isLevelLocked': serializeParam(
          _isLevelLocked,
          ParamType.bool,
        ),
        'levelImage': serializeParam(
          _levelImage,
          ParamType.String,
        ),
        'completionPerc': serializeParam(
          _completionPerc,
          ParamType.double,
        ),
        'levelNumber': serializeParam(
          _levelNumber,
          ParamType.int,
        ),
      }.withoutNulls;

  static LevelStruct fromSerializableMap(Map<String, dynamic> data) =>
      LevelStruct(
        levelName: deserializeParam(
          data['LevelName'],
          ParamType.String,
          false,
        ),
        levelDesc: deserializeParam(
          data['LevelDesc'],
          ParamType.String,
          false,
        ),
        isLevelLocked: deserializeParam(
          data['isLevelLocked'],
          ParamType.bool,
          false,
        ),
        levelImage: deserializeParam(
          data['levelImage'],
          ParamType.String,
          false,
        ),
        completionPerc: deserializeParam(
          data['completionPerc'],
          ParamType.double,
          false,
        ),
        levelNumber: deserializeParam(
          data['levelNumber'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LevelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LevelStruct &&
        levelName == other.levelName &&
        levelDesc == other.levelDesc &&
        isLevelLocked == other.isLevelLocked &&
        levelImage == other.levelImage &&
        completionPerc == other.completionPerc &&
        levelNumber == other.levelNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([
        levelName,
        levelDesc,
        isLevelLocked,
        levelImage,
        completionPerc,
        levelNumber
      ]);
}

LevelStruct createLevelStruct({
  String? levelName,
  String? levelDesc,
  bool? isLevelLocked,
  String? levelImage,
  double? completionPerc,
  int? levelNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LevelStruct(
      levelName: levelName,
      levelDesc: levelDesc,
      isLevelLocked: isLevelLocked,
      levelImage: levelImage,
      completionPerc: completionPerc,
      levelNumber: levelNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LevelStruct? updateLevelStruct(
  LevelStruct? level, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    level
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLevelStructData(
  Map<String, dynamic> firestoreData,
  LevelStruct? level,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (level == null) {
    return;
  }
  if (level.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && level.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final levelData = getLevelFirestoreData(level, forFieldValue);
  final nestedData = levelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = level.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLevelFirestoreData(
  LevelStruct? level, [
  bool forFieldValue = false,
]) {
  if (level == null) {
    return {};
  }
  final firestoreData = mapToFirestore(level.toMap());

  // Add any Firestore field values
  level.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLevelListFirestoreData(
  List<LevelStruct>? levels,
) =>
    levels?.map((e) => getLevelFirestoreData(e, true)).toList() ?? [];
