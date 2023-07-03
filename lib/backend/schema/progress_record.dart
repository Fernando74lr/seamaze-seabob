import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgressRecord extends FirestoreRecord {
  ProgressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  bool hasDay() => _day != null;

  // "progress_value" field.
  double? _progressValue;
  double get progressValue => _progressValue ?? 0.0;
  bool hasProgressValue() => _progressValue != null;

  void _initializeFields() {
    _day = castToType<int>(snapshotData['day']);
    _progressValue = castToType<double>(snapshotData['progress_value']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('progress');

  static Stream<ProgressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgressRecord.fromSnapshot(s));

  static Future<ProgressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgressRecord.fromSnapshot(s));

  static ProgressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgressRecordData({
  int? day,
  double? progressValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'progress_value': progressValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgressRecordDocumentEquality implements Equality<ProgressRecord> {
  const ProgressRecordDocumentEquality();

  @override
  bool equals(ProgressRecord? e1, ProgressRecord? e2) {
    return e1?.day == e2?.day && e1?.progressValue == e2?.progressValue;
  }

  @override
  int hash(ProgressRecord? e) =>
      const ListEquality().hash([e?.day, e?.progressValue]);

  @override
  bool isValidKey(Object? o) => o is ProgressRecord;
}
