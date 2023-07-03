import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RacesRecord extends FirestoreRecord {
  RacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admin" field.
  int? _admin;
  int get admin => _admin ?? 0;
  bool hasAdmin() => _admin != null;

  // "competitors" field.
  int? _competitors;
  int get competitors => _competitors ?? 0;
  bool hasCompetitors() => _competitors != null;

  // "laps_done" field.
  int? _lapsDone;
  int get lapsDone => _lapsDone ?? 0;
  bool hasLapsDone() => _lapsDone != null;

  // "laps_limit" field.
  int? _lapsLimit;
  int get lapsLimit => _lapsLimit ?? 0;
  bool hasLapsLimit() => _lapsLimit != null;

  // "race_name" field.
  String? _raceName;
  String get raceName => _raceName ?? '';
  bool hasRaceName() => _raceName != null;

  // "race_number" field.
  int? _raceNumber;
  int get raceNumber => _raceNumber ?? 0;
  bool hasRaceNumber() => _raceNumber != null;

  // "race_time" field.
  int? _raceTime;
  int get raceTime => _raceTime ?? 0;
  bool hasRaceTime() => _raceTime != null;

  // "race_type" field.
  int? _raceType;
  int get raceType => _raceType ?? 0;
  bool hasRaceType() => _raceType != null;

  // "status_id" field.
  int? _statusId;
  int get statusId => _statusId ?? 0;
  bool hasStatusId() => _statusId != null;

  // "status_name" field.
  String? _statusName;
  String get statusName => _statusName ?? '';
  bool hasStatusName() => _statusName != null;

  // "track" field.
  String? _track;
  String get track => _track ?? '';
  bool hasTrack() => _track != null;

  // "host_id" field.
  int? _hostId;
  int get hostId => _hostId ?? 0;
  bool hasHostId() => _hostId != null;

  // "datetime" field.
  String? _datetime;
  String get datetime => _datetime ?? '';
  bool hasDatetime() => _datetime != null;

  // "images_path" field.
  List<String>? _imagesPath;
  List<String> get imagesPath => _imagesPath ?? const [];
  bool hasImagesPath() => _imagesPath != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "nickname_host" field.
  String? _nicknameHost;
  String get nicknameHost => _nicknameHost ?? '';
  bool hasNicknameHost() => _nicknameHost != null;

  // "photo_url_host" field.
  String? _photoUrlHost;
  String get photoUrlHost => _photoUrlHost ?? '';
  bool hasPhotoUrlHost() => _photoUrlHost != null;

  void _initializeFields() {
    _admin = castToType<int>(snapshotData['admin']);
    _competitors = castToType<int>(snapshotData['competitors']);
    _lapsDone = castToType<int>(snapshotData['laps_done']);
    _lapsLimit = castToType<int>(snapshotData['laps_limit']);
    _raceName = snapshotData['race_name'] as String?;
    _raceNumber = castToType<int>(snapshotData['race_number']);
    _raceTime = castToType<int>(snapshotData['race_time']);
    _raceType = castToType<int>(snapshotData['race_type']);
    _statusId = castToType<int>(snapshotData['status_id']);
    _statusName = snapshotData['status_name'] as String?;
    _track = snapshotData['track'] as String?;
    _hostId = castToType<int>(snapshotData['host_id']);
    _datetime = snapshotData['datetime'] as String?;
    _imagesPath = getDataList(snapshotData['images_path']);
    _created = snapshotData['created'] as DateTime?;
    _nicknameHost = snapshotData['nickname_host'] as String?;
    _photoUrlHost = snapshotData['photo_url_host'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('races');

  static Stream<RacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RacesRecord.fromSnapshot(s));

  static Future<RacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RacesRecord.fromSnapshot(s));

  static RacesRecord fromSnapshot(DocumentSnapshot snapshot) => RacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRacesRecordData({
  int? admin,
  int? competitors,
  int? lapsDone,
  int? lapsLimit,
  String? raceName,
  int? raceNumber,
  int? raceTime,
  int? raceType,
  int? statusId,
  String? statusName,
  String? track,
  int? hostId,
  String? datetime,
  DateTime? created,
  String? nicknameHost,
  String? photoUrlHost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin': admin,
      'competitors': competitors,
      'laps_done': lapsDone,
      'laps_limit': lapsLimit,
      'race_name': raceName,
      'race_number': raceNumber,
      'race_time': raceTime,
      'race_type': raceType,
      'status_id': statusId,
      'status_name': statusName,
      'track': track,
      'host_id': hostId,
      'datetime': datetime,
      'created': created,
      'nickname_host': nicknameHost,
      'photo_url_host': photoUrlHost,
    }.withoutNulls,
  );

  return firestoreData;
}

class RacesRecordDocumentEquality implements Equality<RacesRecord> {
  const RacesRecordDocumentEquality();

  @override
  bool equals(RacesRecord? e1, RacesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.admin == e2?.admin &&
        e1?.competitors == e2?.competitors &&
        e1?.lapsDone == e2?.lapsDone &&
        e1?.lapsLimit == e2?.lapsLimit &&
        e1?.raceName == e2?.raceName &&
        e1?.raceNumber == e2?.raceNumber &&
        e1?.raceTime == e2?.raceTime &&
        e1?.raceType == e2?.raceType &&
        e1?.statusId == e2?.statusId &&
        e1?.statusName == e2?.statusName &&
        e1?.track == e2?.track &&
        e1?.hostId == e2?.hostId &&
        e1?.datetime == e2?.datetime &&
        listEquality.equals(e1?.imagesPath, e2?.imagesPath) &&
        e1?.created == e2?.created &&
        e1?.nicknameHost == e2?.nicknameHost &&
        e1?.photoUrlHost == e2?.photoUrlHost;
  }

  @override
  int hash(RacesRecord? e) => const ListEquality().hash([
        e?.admin,
        e?.competitors,
        e?.lapsDone,
        e?.lapsLimit,
        e?.raceName,
        e?.raceNumber,
        e?.raceTime,
        e?.raceType,
        e?.statusId,
        e?.statusName,
        e?.track,
        e?.hostId,
        e?.datetime,
        e?.imagesPath,
        e?.created,
        e?.nicknameHost,
        e?.photoUrlHost
      ]);

  @override
  bool isValidKey(Object? o) => o is RacesRecord;
}
