import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int lengthOfArray(List<dynamic> list) {
  return list.length;
}

int newGuest(int currentGuestCounter) {
  return currentGuestCounter + 1;
}

int getTimestamp() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  timestamp = int.parse("$timestamp".substring(5, 13));
  return timestamp;
}

String? convertSeconds(int seconds) {
  if (seconds > 60) {
    double minutes = seconds / 60;
    return "$minutes min";
  }
  return "$seconds s";
}

List<int> generateOptionsLaps(int max) {
  List<int> options = [];

  for (int i = 0; i < max; i++) {
    options.add(i + 1);
  }

  return options;
}

String convertJsonToString(dynamic jsonObj) {
  return json.encode(jsonObj);
}

String formatSecondsAsMinutes(int seconds) {
  int minutes = seconds ~/ 60; // Integer division
  int remainingSeconds = seconds % 60;
  String formattedMinutes = minutes.toString().padLeft(2, '0');
  String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
  return '$formattedMinutes:$formattedSeconds';
}

int minutesToMiliseconds(int minutes) {
  return minutes * 60000;
}

int str2Int(String num) {
  try {
    return int.parse(num);
  } catch (e) {
    return 0;
  }
}

String int2Str(int num) {
  try {
    return '$num';
  } catch (e) {
    return '0';
  }
}
