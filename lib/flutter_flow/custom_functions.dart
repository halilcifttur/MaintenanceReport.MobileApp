import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String formatPickedDateToUpdate(
  String date,
  String time,
) {
  var splittedTime = time.split(":");
  var hour = splittedTime[0];
  var min = splittedTime[1];

  var splittedDate = date.split("/");
  var month = splittedDate[0];
  var day = splittedDate[1];
  var year = splittedDate[2];

  if (day.length == 1) {
    day = "0" + day;
  }

  if (month.length == 1) {
    month = "0" + month;
  }

  var newDateString =
      year + "-" + month + "-" + day + "T" + hour + ":" + min + ":00";
  return newDateString;
}

String formatDateFromPicked(
  String date,
  String time,
) {
  var splittedTime = time.split(":");
  var hour = splittedTime[0];
  var min = splittedTime[1];

  var splittedDate = date.split("/");
  var month = splittedDate[0];
  var day = splittedDate[1];
  var year = splittedDate[2];

  if (day.length == 1) {
    day = "0" + day;
  }

  if (month.length == 1) {
    month = "0" + month;
  }

  var newDateString = day + "/" + month + "/" + year + " " + hour + ":" + min;
  return newDateString;
}

String formatDateFromData(String dateTime) {
  if (dateTime.isNotEmpty && dateTime != "null") {
    var date = DateTime.parse(dateTime);

    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }
  return "The date not yet set";
}

String convertJsonListToString(List<dynamic> entities) {
  return entities.toString();
}

dynamic convertPropsToJsonListItem(
  String checkinId,
  String entityId,
  bool isChecked,
) {
  var jsonItem = {
    "checkinId": checkinId,
    "id": entityId,
    "isChecked": isChecked
  };

  return jsonItem;
}

bool checkIfItemExist(
  String checkinId,
  String entityId,
  bool isChecked,
  List<dynamic> entityList,
) {
  var jsonItem = {
    "checkinId": checkinId,
    "id": entityId,
    "isChecked": isChecked
  };

  if (entityList.contains(jsonItem)) {
    return true;
  }

  return false;
}

String textNullCheck(String text) {
  if (text == "null") {
    return "";
  }
  return text;
}
