// hex code to Color code

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tution_manager/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

String hexToColor(String hexColor) {
  String onlyCode = hexColor.substring(1);
  String color = "0xff$onlyCode";
  return color;
}

copyToClipboard({String? text}) async {
  await Clipboard.setData(ClipboardData(text: text ?? ""));
}

//
final TextStyle primaryTextStyle = TextStyle(
  color: colorManager.textColor,
  fontFamily: 'SF Pro',
);
//
toggleDrawer(GlobalKey<ScaffoldState> key) {
  key.currentState!.isDrawerOpen
      ? key.currentState!.closeDrawer()
      : key.currentState!.openDrawer();
}

Future<bool> setData({
  required String key,
  required dynamic value,
  required String type,
}) async {
  final prefs = await SharedPreferences.getInstance();

  switch (type) {
    case "string":
      return prefs.setString(key, value);
    case "bool":
      return prefs.setBool(key, value);
    case "double":
      return prefs.setDouble(key, value);
    case "int":
      return prefs.setInt(key, value);
    case "list":
    case "map":
      return prefs.setString(key, jsonEncode(value));
    default:
      throw Exception("Unsupported type: $type");
  }
}

Future<dynamic> getData({required String key, required String type}) async {
  final prefs = await SharedPreferences.getInstance();

  switch (type) {
    case "string":
      return prefs.getString(key);
    case "bool":
      return prefs.getBool(key);
    case "double":
      return prefs.getDouble(key);
    case "int":
      return prefs.getInt(key);
    case "list":
    case "map":
      final raw = prefs.getString(key);
      return raw != null ? jsonDecode(raw) : null;
    default:
      throw Exception("Unsupported type: $type");
  }
}

prettyPrint(mapData) {
  var data = JsonEncoder.withIndent('  ').convert(mapData);
  log(data);
}
bool isEmail(String input) {
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegex.hasMatch(input);
}

bool isPhoneNumber(String input) {
  final phoneRegex = kDebugMode ? RegExp(r'^\d{4,14}$') : RegExp(r'^\d{9,14}$');
  return phoneRegex.hasMatch(input);
}
