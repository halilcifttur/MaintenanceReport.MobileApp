import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LoginCall {
  static Future<ApiCallResponse> call({
    String username = '',
    String password = '',
    String grantType = 'password',
    String scope = 'TrackerApp email openid profile',
    String clientId = 'TrackerApp_App',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://oldgrass4764.cotunnel.com/connect/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'username': username,
        'password': password,
        'grant_type': grantType,
        'scope': scope,
        'client_id': clientId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
    );
  }

  static dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
}

class UserInfoCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'UserInfo',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/account/my-profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {},
      returnBody: true,
    );
  }
}

class LogoutCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/account/logout',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {},
      returnBody: true,
    );
  }
}

class ChangePersonalInfoCall {
  static Future<ApiCallResponse> call({
    String userName = '',
    String name = '',
    String surname = '',
    String email = '',
    String phoneNumber = '',
  }) {
    final body = '''
{
  "userName": "${userName}",
  "name": "${name}",
  "surname": "${surname}",
  "email": "${email}",
  "phoneNumber": "${phoneNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangePersonalInfo',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/account/my-profile',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'userName': userName,
        'name': name,
        'surname': surname,
        'email': email,
        'phoneNumber': phoneNumber,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class ChangePasswordCall {
  static Future<ApiCallResponse> call({
    String currentPassword = '',
    String newPassword = '',
    String newPasswordConfirm = '',
  }) {
    final body = '''
{
  "currentPassword": "${currentPassword}",
  "newPassword": "${newPassword}",
  "newPasswordConfirm": "${newPasswordConfirm}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangePassword',
      apiUrl:
          'https://oldgrass4764.cotunnel.com/api/account/my-profile/change-password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'newPasswordConfirm': newPasswordConfirm,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetUsersCall {
  static Future<ApiCallResponse> call({
    String sorting = '',
    String filter = '',
    int skipCount = 0,
    int maxResultCount = 10,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUsers',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/identity/users',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'Sorting': sorting,
        'Filter': filter,
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
      },
      returnBody: true,
    );
  }
}

class GetRolesCall {
  static Future<ApiCallResponse> call({
    String filter = '',
    String sorting = '',
    int skipCount = 0,
    int maxResultCount = 10,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetRoles',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/identity/roles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'Filter': filter,
        'Sorting': sorting,
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
      },
      returnBody: true,
    );
  }

  static dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
      );
}

class GetYardsCall {
  static Future<ApiCallResponse> call({
    String sorting = '',
    String filter = '',
    int skipCount = 0,
    int maxResultCount = 10,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetYards',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/multi-tenancy/tenants',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'Sorting': sorting,
        'Filter': filter,
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
      },
      returnBody: true,
    );
  }
}

class AddRoleCall {
  static Future<ApiCallResponse> call({
    String name = '',
    bool isDefault,
    bool isPublic,
  }) {
    final body = '''
{
  "name": "${name}",
  "isDefault": ${isDefault},
  "isPublic": ${isPublic}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddRole',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/identity/roles',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'name': name,
        'isDefault': isDefault,
        'isPublic': isPublic,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UpdateRoleCall {
  static Future<ApiCallResponse> call({
    String roleId = '',
    String name = '',
    bool isDefault,
    bool isPublic,
  }) {
    final body = '''
{
  "name": "${name}",
  "isDefault": ${isDefault},
  "isPublic": ${isPublic}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateRole',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/identity/roles/${roleId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'name': name,
        'isDefault': isDefault,
        'isPublic': isPublic,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetAnomalyListCall {
  static Future<ApiCallResponse> call({
    int skipCount = 0,
    int maxResultCount = 10,
    String sorting = '',
    int anomalyStatus,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAnomalyList',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/app/anomaly',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
        'Sorting': sorting,
        'AnomalyStatus': anomalyStatus,
      },
      returnBody: true,
    );
  }

  static dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
      );
}

class GetMaterialListCall {
  static Future<ApiCallResponse> call({
    int skipCount = 0,
    int maxResultCount = 10,
    String sorting = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMaterialList',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/app/material',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
        'Sorting': sorting,
      },
      returnBody: true,
    );
  }

  static dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
      );
  static dynamic itemNames(dynamic response) => getJsonField(
        response,
        r'''$.items..name''',
      );
}

class AddAnomalyCall {
  static Future<ApiCallResponse> call({
    String materialName = '',
    String cause = '',
    String anomalyStartDate = 'null',
  }) {
    final body = '''
{
  "materialName": "${materialName}",
  "cause": "${cause}",
  "anomalyStartDate": "${anomalyStartDate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddAnomaly',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/app/anomaly',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'materialName': materialName,
        'cause': cause,
        'anomalyStartDate': anomalyStartDate,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UpdateAnomalyCall {
  static Future<ApiCallResponse> call({
    String anomalyId = '',
    int status,
    String action = '',
    String anomalyEndDate = '',
    String maintenanceStartDate = '',
    String maintenanceEndDate = '',
  }) {
    final body = '''
{
  "id": "${anomalyId}",
  "status": ${status},
  "action": "${action}",
  "anomalyEndDate": "${anomalyEndDate}",
  "maintenanceStartDate": "${maintenanceStartDate}",
  "maintenanceEndDate": "${maintenanceEndDate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateAnomaly',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/app/anomaly/${anomalyId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'status': status,
        'action': action,
        'anomalyEndDate': anomalyEndDate,
        'maintenanceStartDate': maintenanceStartDate,
        'maintenanceEndDate': maintenanceEndDate,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetMaintenanceListCall {
  static Future<ApiCallResponse> call({
    int skipCount = 0,
    int maxResultCount = 10,
    String sorting = '',
    int maintenanceType,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMaintenanceList',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/app/maintenance',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
        'Sorting': sorting,
        'MaintenanceType': maintenanceType,
      },
      returnBody: true,
    );
  }

  static dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
      );
}

class AddMaintenanceCall {
  static Future<ApiCallResponse> call({
    String materialName = '',
    int maintenanceType,
  }) {
    final body = '''
{
  "materialName": "${materialName}",
  "maintenanceType": ${maintenanceType}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddMaintenance',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/app/maintenance',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'materialName': materialName,
        'maintenanceType': maintenanceType,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetMaintenanceCall {
  static Future<ApiCallResponse> call({
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMaintenance',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/app/maintenance/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic entities(dynamic response) => getJsonField(
        response,
        r'''$.entities''',
      );
  static dynamic entitiesCheckinName(dynamic response) => getJsonField(
        response,
        r'''$.entities..checkinName''',
      );
}

class UpdateMaintenanceCall {
  static Future<ApiCallResponse> call({
    String id = '',
    int status = 0,
    int kmHour,
    String entities = '',
  }) {
    final body = '''
{
  "id": "${id}",
  "status": ${status},
  "kmHour": ${kmHour},
  "entities": "${entities}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateMaintenance',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/app/maintenance/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {
        'status': status,
        'kmHour': kmHour,
        'entities': entities,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetAnomalyCall {
  static Future<ApiCallResponse> call({
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAnomaly',
      apiUrl: 'https://oldgrass4764.cotunnel.com/api/app/anomaly/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY0MjMyMkE4Qzk3QjM1MzM1REI3Mjc0QTlFOEE1QTdEIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2NTMxMjUzOTcsImV4cCI6MTY4NDY2MTM5NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjgiLCJhdWQiOiJUcmFja2VyQXBwIiwiY2xpZW50X2lkIjoiVHJhY2tlckFwcF9CbGF6b3IiLCJzdWIiOiJiNDY5NGM1MC1hZDRhLWMyZGYtNDY1Ni0zYTAzZjE5OWI3MWQiLCJhdXRoX3RpbWUiOjE2NTMxMjUzOTEsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiYWRtaW4iLCJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYWRtaW4iLCJnaXZlbl9uYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJwaG9uZV9udW1iZXJfdmVyaWZpZWQiOiJGYWxzZSIsImVtYWlsIjoiYWRtaW5AYWJwLmlvIiwiZW1haWxfdmVyaWZpZWQiOiJGYWxzZSIsIm5hbWUiOiJhZG1pbiIsInNpZCI6IjY0MTdFODc5N0VCMTgwREU0NjY0RUZFMkYyQUY5QTg2IiwiaWF0IjoxNjUzMTI1Mzk3LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiVHJhY2tlckFwcCIsInJvbGUiLCJlbWFpbCIsInBob25lIl0sImFtciI6WyJwd2QiXX0.i925cMVMMh0zG_XR0VGebH_jhaKtneaVRwBGSdwDWnuTQE5DLOJEPKoBWpV1oI8neJw95Hb--OsPyAutZaLdmLj52xErGekaYkh71y4TKm2nkfjqNaXAh8iXppVHw5a1SJzYfZe5-tzxVK9EscjBtMkg-PPhqNTElJoqxl044IQDE9P9XhGZBU-GjcZo5NK4Bqek7IC-o1X9nsMXrj_tqTRE1_A1EJoFpP3fPc3GTmbi6TByAomwh35tclc0GntYwhN9odq0dCIeoG5g-4zQxRSNsQ5aRpLcEMYeU68IyBity-YYjf0Pl9D60I_3NZ1PBQJoRtUOgar_WXcVrFztOg',
      },
      params: {},
      returnBody: true,
    );
  }
}
