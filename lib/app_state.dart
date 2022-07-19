import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ff_userInfo')) {
      try {
        _userInfo = jsonDecode(prefs.getString('ff_userInfo'));
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _accessToken = prefs.getString('ff_accessToken') ?? _accessToken;
  }

  SharedPreferences prefs;

  dynamic _userInfo;
  dynamic get userInfo => _userInfo;
  set userInfo(dynamic _value) {
    _userInfo = _value;
    prefs.setString('ff_userInfo', jsonEncode(_value));
  }

  dynamic updatedUserInfo;

  dynamic userList;

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
    prefs.setString('ff_accessToken', _value);
  }

  List<dynamic> materialNames = [];

  String maintenanceStartDate = '';

  List<dynamic> entities = [];
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
