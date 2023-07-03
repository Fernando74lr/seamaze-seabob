// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> checkURLConnection() async {
  final url = Uri.parse('http://10.42.0.1/status');
  try {
    final response = await http.get(url).timeout(Duration(seconds: 3));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}
