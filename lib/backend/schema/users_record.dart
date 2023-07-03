import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "birth_date" field.
  String? _birthDate;
  String get birthDate => _birthDate ?? '';
  bool hasBirthDate() => _birthDate != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "num_races" field.
  int? _numRaces;
  int get numRaces => _numRaces ?? 0;
  bool hasNumRaces() => _numRaces != null;

  // "world_ranking" field.
  int? _worldRanking;
  int get worldRanking => _worldRanking ?? 0;
  bool hasWorldRanking() => _worldRanking != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  bool hasWeight() => _weight != null;

  // "laps" field.
  int? _laps;
  int get laps => _laps ?? 0;
  bool hasLaps() => _laps != null;

  // "best_lap" field.
  String? _bestLap;
  String get bestLap => _bestLap ?? '';
  bool hasBestLap() => _bestLap != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _birthDate = snapshotData['birth_date'] as String?;
    _gender = snapshotData['gender'] as String?;
    _bio = snapshotData['bio'] as String?;
    _username = snapshotData['username'] as String?;
    _numRaces = castToType<int>(snapshotData['num_races']);
    _worldRanking = castToType<int>(snapshotData['world_ranking']);
    _weight = snapshotData['weight'] as String?;
    _laps = castToType<int>(snapshotData['laps']);
    _bestLap = snapshotData['best_lap'] as String?;
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? birthDate,
  String? gender,
  String? bio,
  String? username,
  int? numRaces,
  int? worldRanking,
  String? weight,
  int? laps,
  String? bestLap,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'birth_date': birthDate,
      'gender': gender,
      'bio': bio,
      'username': username,
      'num_races': numRaces,
      'world_ranking': worldRanking,
      'weight': weight,
      'laps': laps,
      'best_lap': bestLap,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.birthDate == e2?.birthDate &&
        e1?.gender == e2?.gender &&
        e1?.bio == e2?.bio &&
        e1?.username == e2?.username &&
        e1?.numRaces == e2?.numRaces &&
        e1?.worldRanking == e2?.worldRanking &&
        e1?.weight == e2?.weight &&
        e1?.laps == e2?.laps &&
        e1?.bestLap == e2?.bestLap &&
        e1?.id == e2?.id;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.birthDate,
        e?.gender,
        e?.bio,
        e?.username,
        e?.numRaces,
        e?.worldRanking,
        e?.weight,
        e?.laps,
        e?.bestLap,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
