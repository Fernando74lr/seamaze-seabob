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
import 'package:path_provider/path_provider.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<bool> saveFileToDeviceStorage(String apiUrl, String fileName) async {
  try {
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      // Get the external storage directory
      final directory = await getExternalStorageDirectory();
      final path = directory?.path;

      // Save file to device storage
      File('$path/$fileName').writeAsBytesSync(response.bodyBytes);
      return true;
    } else {
      throw Exception('Failed to load file from API');
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}
