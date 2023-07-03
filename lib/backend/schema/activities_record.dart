import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivitiesRecord extends FirestoreRecord {
  ActivitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "best_lap" field.
  String? _bestLap;
  String get bestLap => _bestLap ?? '';
  bool hasBestLap() => _bestLap != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "ranking" field.
  String? _ranking;
  String get ranking => _ranking ?? '';
  bool hasRanking() => _ranking != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "track" field.
  String? _track;
  String get track => _track ?? '';
  bool hasTrack() => _track != null;

  // "bg_cover" field.
  String? _bgCover;
  String get bgCover => _bgCover ?? '';
  bool hasBgCover() => _bgCover != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "user_photo" field.
  String? _userPhoto;
  String get userPhoto => _userPhoto ?? '';
  bool hasUserPhoto() => _userPhoto != null;

  // "imagesPath" field.
  List<String>? _imagesPath;
  List<String> get imagesPath => _imagesPath ?? const [];
  bool hasImagesPath() => _imagesPath != null;

  void _initializeFields() {
    _bestLap = snapshotData['best_lap'] as String?;
    _duration = snapshotData['duration'] as String?;
    _ranking = snapshotData['ranking'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _track = snapshotData['track'] as String?;
    _bgCover = snapshotData['bg_cover'] as String?;
    _username = snapshotData['username'] as String?;
    _userPhoto = snapshotData['user_photo'] as String?;
    _imagesPath = getDataList(snapshotData['imagesPath']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activities');

  static Stream<ActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivitiesRecord.fromSnapshot(s));

  static Future<ActivitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivitiesRecord.fromSnapshot(s));

  static ActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivitiesRecordData({
  String? bestLap,
  String? duration,
  String? ranking,
  DateTime? createdAt,
  String? location,
  DocumentReference? userRef,
  String? track,
  String? bgCover,
  String? username,
  String? userPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'best_lap': bestLap,
      'duration': duration,
      'ranking': ranking,
      'created_at': createdAt,
      'location': location,
      'user_ref': userRef,
      'track': track,
      'bg_cover': bgCover,
      'username': username,
      'user_photo': userPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivitiesRecordDocumentEquality implements Equality<ActivitiesRecord> {
  const ActivitiesRecordDocumentEquality();

  @override
  bool equals(ActivitiesRecord? e1, ActivitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bestLap == e2?.bestLap &&
        e1?.duration == e2?.duration &&
        e1?.ranking == e2?.ranking &&
        e1?.createdAt == e2?.createdAt &&
        e1?.location == e2?.location &&
        e1?.userRef == e2?.userRef &&
        e1?.track == e2?.track &&
        e1?.bgCover == e2?.bgCover &&
        e1?.username == e2?.username &&
        e1?.userPhoto == e2?.userPhoto &&
        listEquality.equals(e1?.imagesPath, e2?.imagesPath);
  }

  @override
  int hash(ActivitiesRecord? e) => const ListEquality().hash([
        e?.bestLap,
        e?.duration,
        e?.ranking,
        e?.createdAt,
        e?.location,
        e?.userRef,
        e?.track,
        e?.bgCover,
        e?.username,
        e?.userPhoto,
        e?.imagesPath
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivitiesRecord;
}
