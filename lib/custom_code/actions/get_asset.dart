// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';

Future<FFUploadedFile> getAsset(String assetName) async {
  // get asset file by name
// Use the rootBundle to load the asset file
  final ByteData assetByteData = await rootBundle.load('assets/$assetName');

// Convert the ByteData to a Uint8List
  final Uint8List assetData = assetByteData.buffer.asUint8List();

// Create a FFUploadedFile object with the asset data and name
  final FFUploadedFile assetFile = FFUploadedFile(
    name: assetName,
    bytes: assetData,
  );

// Return the asset file
  return assetFile;
}
