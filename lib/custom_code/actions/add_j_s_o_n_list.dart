// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<String> addJSONList(
  List<dynamic> entityList,
  String checkinId,
  String entityId,
  bool isChecked,
) async {
  var jsonItem = {
    "checkinId": checkinId,
    "id": entityId,
    "isChecked": isChecked
  };

  if (entityList.contains(jsonItem)) {
    return entityList.toString();
  }
}
