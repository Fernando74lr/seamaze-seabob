import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start RACE Group Code

class RaceGroup {
  static String baseUrl = 'http://10.42.0.1';
  static Map<String, String> headers = {};
  static BeginRaceCall beginRaceCall = BeginRaceCall();
  static StartRaceCall startRaceCall = StartRaceCall();
  static StopRaceCall stopRaceCall = StopRaceCall();
  static AddUserCall addUserCall = AddUserCall();
  static RaceTypeCall raceTypeCall = RaceTypeCall();
  static SelectTrackCall selectTrackCall = SelectTrackCall();
  static GetStatusCall getStatusCall = GetStatusCall();
  static ViewRaceCall viewRaceCall = ViewRaceCall();
  static TestCall testCall = TestCall();
  static StatusCall statusCall = StatusCall();
}

class BeginRaceCall {
  Future<ApiCallResponse> call({
    int? userId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Begin race',
      apiUrl: '${RaceGroup.baseUrl}/begin_race',
      callType: ApiCallType.POST,
      headers: {
        ...RaceGroup.headers,
      },
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StartRaceCall {
  Future<ApiCallResponse> call({
    int? userId = 1,
    String? raceName = 'NEW RACE',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Start race',
      apiUrl: '${RaceGroup.baseUrl}/start_race',
      callType: ApiCallType.POST,
      headers: {
        ...RaceGroup.headers,
      },
      params: {
        'user_id': userId,
        'race_name': raceName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StopRaceCall {
  Future<ApiCallResponse> call({
    int? userId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Stop race',
      apiUrl: '${RaceGroup.baseUrl}/stop_race',
      callType: ApiCallType.POST,
      headers: {
        ...RaceGroup.headers,
      },
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddUserCall {
  Future<ApiCallResponse> call({
    int? userId = 1,
    String? nickname = '',
    String? tag = '',
    String? seabobModel = '',
    FFUploadedFile? image,
    int? guest = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add user',
      apiUrl: '${RaceGroup.baseUrl}/add_user',
      callType: ApiCallType.POST,
      headers: {
        ...RaceGroup.headers,
      },
      params: {
        'user_id': userId,
        'nickname': nickname,
        'tag': tag,
        'seabob_model': seabobModel,
        'image': image,
        'guest': guest,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RaceTypeCall {
  Future<ApiCallResponse> call({
    int? raceType = 0,
    int? lapsLimit = 0,
    int? userId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Race type',
      apiUrl: '${RaceGroup.baseUrl}/race_type',
      callType: ApiCallType.POST,
      headers: {
        ...RaceGroup.headers,
      },
      params: {
        'race_type': raceType,
        'laps_limit': lapsLimit,
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SelectTrackCall {
  Future<ApiCallResponse> call({
    String? track = '',
    int? userId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Select track',
      apiUrl: '${RaceGroup.baseUrl}/select_track',
      callType: ApiCallType.POST,
      headers: {
        ...RaceGroup.headers,
      },
      params: {
        'track': track,
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetStatusCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get status',
      apiUrl: '${RaceGroup.baseUrl}/status',
      callType: ApiCallType.GET,
      headers: {
        ...RaceGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ViewRaceCall {
  Future<ApiCallResponse> call({
    String? path = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'View race',
      apiUrl: '${RaceGroup.baseUrl}/view_race',
      callType: ApiCallType.GET,
      headers: {
        ...RaceGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TestCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Test',
      apiUrl: '${RaceGroup.baseUrl}/test',
      callType: ApiCallType.GET,
      headers: {
        ...RaceGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StatusCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Status',
      apiUrl: '${RaceGroup.baseUrl}/status',
      callType: ApiCallType.GET,
      headers: {
        ...RaceGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End RACE Group Code

/// Start RACE LOCAL Group Code

class RaceLocalGroup {
  static String baseUrl = 'http://192.168.0.183:3000';
  static Map<String, String> headers = {};
  static BeginRaceCopyCall beginRaceCopyCall = BeginRaceCopyCall();
  static StartRaceCopyCall startRaceCopyCall = StartRaceCopyCall();
  static StopRaceCopyCall stopRaceCopyCall = StopRaceCopyCall();
  static AddUserCopyCall addUserCopyCall = AddUserCopyCall();
  static RaceTypeCopyCall raceTypeCopyCall = RaceTypeCopyCall();
  static SelectTrackCopyCall selectTrackCopyCall = SelectTrackCopyCall();
  static GetStatusCopyCall getStatusCopyCall = GetStatusCopyCall();
  static ViewRaceCopyCall viewRaceCopyCall = ViewRaceCopyCall();
  static TestCopyCall testCopyCall = TestCopyCall();
  static VideoTestCall videoTestCall = VideoTestCall();
  static VideoLastTestCall videoLastTestCall = VideoLastTestCall();
}

class BeginRaceCopyCall {
  Future<ApiCallResponse> call({
    int? userId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Begin race Copy',
      apiUrl: '${RaceLocalGroup.baseUrl}/begin_race',
      callType: ApiCallType.POST,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StartRaceCopyCall {
  Future<ApiCallResponse> call({
    int? userId = 1,
    String? raceName = 'NEW RACE',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Start race Copy',
      apiUrl: '${RaceLocalGroup.baseUrl}/start_race',
      callType: ApiCallType.POST,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {
        'user_id': userId,
        'race_name': raceName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StopRaceCopyCall {
  Future<ApiCallResponse> call({
    int? userId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Stop race Copy',
      apiUrl: '${RaceLocalGroup.baseUrl}/stop_race',
      callType: ApiCallType.POST,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddUserCopyCall {
  Future<ApiCallResponse> call({
    int? userId = 1,
    String? nickname = '',
    String? tag = '',
    String? seabobModel = '',
    FFUploadedFile? image,
    int? guest = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add user Copy',
      apiUrl: '${RaceLocalGroup.baseUrl}/add_user',
      callType: ApiCallType.POST,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {
        'user_id': userId,
        'nickname': nickname,
        'tag': tag,
        'seabob_model': seabobModel,
        'image': image,
        'guest': guest,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RaceTypeCopyCall {
  Future<ApiCallResponse> call({
    int? raceType = 0,
    int? lapsLimit = 0,
    int? userId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Race type Copy',
      apiUrl: '${RaceLocalGroup.baseUrl}/race_type',
      callType: ApiCallType.POST,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {
        'race_type': raceType,
        'laps_limit': lapsLimit,
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SelectTrackCopyCall {
  Future<ApiCallResponse> call({
    String? track = '',
    int? userId = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Select track Copy',
      apiUrl: '${RaceLocalGroup.baseUrl}/select_track',
      callType: ApiCallType.POST,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {
        'track': track,
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetStatusCopyCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get status Copy',
      apiUrl: '${RaceLocalGroup.baseUrl}/status',
      callType: ApiCallType.GET,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ViewRaceCopyCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'View race Copy',
      apiUrl: '${RaceLocalGroup.baseUrl}/view_race',
      callType: ApiCallType.GET,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TestCopyCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Test Copy',
      apiUrl: '${RaceLocalGroup.baseUrl}/test',
      callType: ApiCallType.GET,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VideoTestCall {
  Future<ApiCallResponse> call({
    String? path = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Video Test',
      apiUrl: '${RaceLocalGroup.baseUrl}/file_test',
      callType: ApiCallType.POST,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {},
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VideoLastTestCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Video last test',
      apiUrl: '${RaceLocalGroup.baseUrl}/file/test_video.mp4',
      callType: ApiCallType.GET,
      headers: {
        ...RaceLocalGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End RACE LOCAL Group Code

/// Start SEAMAZE Group Code

class SeamazeGroup {
  static String baseUrl =
      'https://desarrollo-web-323816.uc.r.appspot.com/api/seamaze';
  static Map<String, String> headers = {};
  static AddRaceCall addRaceCall = AddRaceCall();
  static GetRaceCall getRaceCall = GetRaceCall();
  static GetRacesCall getRacesCall = GetRacesCall();
  static CheckChatExistsCall checkChatExistsCall = CheckChatExistsCall();
  static TestTimeCall testTimeCall = TestTimeCall();
  static RaceInProgressCall raceInProgressCall = RaceInProgressCall();
}

class AddRaceCall {
  Future<ApiCallResponse> call({
    dynamic? dataJson,
    int? userId = 0,
    List<String>? imagesPathList,
    String? nicknameHost = '',
    String? photoUrlHost = '',
  }) {
    final imagesPath = _serializeList(imagesPathList);
    final data = _serializeJson(dataJson);
    final body = '''
{
  "data": ${data},
  "userId": ${userId},
  "images_path": ${imagesPath},
  "nickname_host": "${nicknameHost}",
  "photo_url_host": "${photoUrlHost}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add race',
      apiUrl: '${SeamazeGroup.baseUrl}/addRace',
      callType: ApiCallType.POST,
      headers: {
        ...SeamazeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetRaceCall {
  Future<ApiCallResponse> call({
    int? raceId = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get race',
      apiUrl: '${SeamazeGroup.baseUrl}/getRace',
      callType: ApiCallType.GET,
      headers: {
        ...SeamazeGroup.headers,
      },
      params: {
        'raceId': raceId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetRacesCall {
  Future<ApiCallResponse> call({
    int? userId = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get races',
      apiUrl: '${SeamazeGroup.baseUrl}/getRaces',
      callType: ApiCallType.GET,
      headers: {
        ...SeamazeGroup.headers,
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic admin(dynamic response) => getJsonField(
        response,
        r'''$.admin''',
      );
  dynamic competitors(dynamic response) => getJsonField(
        response,
        r'''$.competitors''',
      );
  dynamic lapsDone(dynamic response) => getJsonField(
        response,
        r'''$.laps_done''',
      );
  dynamic lapsLimit(dynamic response) => getJsonField(
        response,
        r'''$.laps_limit''',
      );
  dynamic raceName(dynamic response) => getJsonField(
        response,
        r'''$.race_name''',
      );
  dynamic raceNumber(dynamic response) => getJsonField(
        response,
        r'''$.race_number''',
      );
  dynamic raceTime(dynamic response) => getJsonField(
        response,
        r'''$.race_time''',
      );
  dynamic raceType(dynamic response) => getJsonField(
        response,
        r'''$.race_type''',
      );
  dynamic statusId(dynamic response) => getJsonField(
        response,
        r'''$.status_id''',
      );
  dynamic statusName(dynamic response) => getJsonField(
        response,
        r'''$.status_name''',
      );
  dynamic track(dynamic response) => getJsonField(
        response,
        r'''$.track''',
      );
  dynamic users(dynamic response) => getJsonField(
        response,
        r'''$.users''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic dateTime(dynamic response) => getJsonField(
        response,
        r'''$.datetime''',
      );
  dynamic imagesPath(dynamic response) => getJsonField(
        response,
        r'''$.images_path''',
      );
}

class CheckChatExistsCall {
  Future<ApiCallResponse> call({
    String? userARef = '',
    String? userBRef = '',
  }) {
    final body = '''
{
    "userARef": "${userARef}" ,
    "userARef": "${userBRef}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Check chat exists',
      apiUrl: '${SeamazeGroup.baseUrl}/doesChatExist',
      callType: ApiCallType.POST,
      headers: {
        ...SeamazeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TestTimeCall {
  Future<ApiCallResponse> call({
    String? time = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Test time',
      apiUrl: '${SeamazeGroup.baseUrl}/test',
      callType: ApiCallType.GET,
      headers: {
        ...SeamazeGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RaceInProgressCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Race in progress',
      apiUrl: '${SeamazeGroup.baseUrl}/raceInProgress',
      callType: ApiCallType.GET,
      headers: {
        ...SeamazeGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End SEAMAZE Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
