import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_storedRace')) {
        try {
          _storedRace = jsonDecode(prefs.getString('ff_storedRace') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _profileSection = 'races';
  String get profileSection => _profileSection;
  set profileSection(String _value) {
    _profileSection = _value;
  }

  bool _isInRace = false;
  bool get isInRace => _isInRace;
  set isInRace(bool _value) {
    _isInRace = _value;
  }

  int _guestCounter = 0;
  int get guestCounter => _guestCounter;
  set guestCounter(int _value) {
    _guestCounter = _value;
  }

  int _userId = 1;
  int get userId => _userId;
  set userId(int _value) {
    _userId = _value;
  }

  dynamic _currentUser = jsonDecode('{}');
  dynamic get currentUser => _currentUser;
  set currentUser(dynamic _value) {
    _currentUser = _value;
  }

  List<String> _seabobModels = [
    'Seabob F5',
    'Seabob F5S',
    'Seabob F5SR',
    'Sublue Tini',
    'Sublue navbow+',
    'Sublue MixPro',
    'Others'
  ];
  List<String> get seabobModels => _seabobModels;
  set seabobModels(List<String> _value) {
    _seabobModels = _value;
  }

  void addToSeabobModels(String _value) {
    _seabobModels.add(_value);
  }

  void removeFromSeabobModels(String _value) {
    _seabobModels.remove(_value);
  }

  void removeAtIndexFromSeabobModels(int _index) {
    _seabobModels.removeAt(_index);
  }

  void updateSeabobModelsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _seabobModels[_index] = updateFn(_seabobModels[_index]);
  }

  dynamic _storedRace = jsonDecode('{\"race_time\":0}');
  dynamic get storedRace => _storedRace;
  set storedRace(dynamic _value) {
    _storedRace = _value;
    prefs.setString('ff_storedRace', jsonEncode(_value));
  }

  dynamic _waitingRoom;
  dynamic get waitingRoom => _waitingRoom;
  set waitingRoom(dynamic _value) {
    _waitingRoom = _value;
  }

  dynamic _testRace = jsonDecode(
      '{\"users\":[{\"user_id\":65584238,\"nickname\":\"Andree\"}]}');
  dynamic get testRace => _testRace;
  set testRace(dynamic _value) {
    _testRace = _value;
  }

  int _timerDown = 50000;
  int get timerDown => _timerDown;
  set timerDown(int _value) {
    _timerDown = _value;
  }

  List<String> _video = ['http://10.42.0.1/video/16/AA56B6/1'];
  List<String> get video => _video;
  set video(List<String> _value) {
    _video = _value;
  }

  void addToVideo(String _value) {
    _video.add(_value);
  }

  void removeFromVideo(String _value) {
    _video.remove(_value);
  }

  void removeAtIndexFromVideo(int _index) {
    _video.removeAt(_index);
  }

  void updateVideoAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _video[_index] = updateFn(_video[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
