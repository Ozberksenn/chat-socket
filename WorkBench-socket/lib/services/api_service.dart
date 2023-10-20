import "dart:convert";
import 'package:get/get.dart';
import '../utils/utils.dart';
import 'storage_service.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxService {
  static ApiService get() => Get.find();

  final box = Get.find<StorageService>();
  final int companyId = 1;
  final int tenantId = 1;
  final String apiEndpoint = "https://demonode.opex.app/";

  final String source = 'ContactUs';

  final String apiToken =
      "crmforminsertapi#1\$12ea42894243dfab951b8f3990ec35a73d4fa537fbe71f0a137b7a8ce1e3d2e68c50b7a1c8402435f32228ff136321ed3321aea9069f5bab921ca789ab295450";
  Future<ApiService> init() async {
    return this;
  }

  Future<ApiResponse> execApi(
      String spname, String baseobject, Map<String, dynamic> parameters) async {
    ApiRequest execRequest = ApiRequest(
        action: "Execute",
        object: spname,
        baseObject: baseobject,
        loginToken: apiToken,
        parameters: parameters);
    ApiResponse response = await httpPost(execRequest);
    return response;
  }

  Future<ApiResponse> apiSequence(
      String name, Map<String, dynamic> parameters) async {
    ApiRequest execRequest =
        ApiRequest(action: "ApiSequence", object: name, parameters: parameters);
    ApiResponse response = await httpPost(execRequest);
    return response;
  }

  // Future formSelect(String pageName, String baseObject,
  //     Map<String, dynamic> parameters) async {
  //   ApiResponse response = await execApi(
  //       "App${pageName.toUpperCase()}List", baseObject, parameters);

  //   Map<String, dynamic> data = {};
  //   if (response.resultSets.isNotEmpty) {
  //     if (response.resultSets[0].isNotEmpty) {
  //       data = response.resultSets[0][0];
  //     }
  //   }
  //   if (pageName == "task") {
  //     return Task.fromJson(json.encode(data)).toMap();
  //   } else if (pageName == "tasklog") {
  //     return TaskLog.fromJson(json.encode(data)).toMap();
  //   } else if (pageName == "lost") {
  //     return Lost.fromJson(json.encode(data)).toMap();
  //   } else if (pageName == "comment") {
  //     return Comment.fromJson(json.encode(data)).toMap();
  //   } else if (pageName == "survey") {
  //     return Comment.fromJson(json.encode(data)).toMap();
  //   } else if (pageName == "checklist") {
  //     return CheckList.fromJson(json.encode(data));
  //   } else if (pageName == "guest") {
  //     return Guest.fromJson(json.encode(data)).toMap();
  //   } else if (pageName == "guestselect") {
  //     return Guest.fromJson(json.encode(data)).toMap();
  //   } else if (pageName == "approval") {
  //     return Approval.fromJson(json.encode(data));
  //   } else if (pageName == "callcenter") {
  //     return CallCenter.fromJson(json.encode(data));
  //   } else if (pageName == "roomrack") {
  //     return Roomrack.fromJson(json.encode(data));
  //   } else if (pageName == "reminder") {
  //     return Reminder.fromJson(json.encode(data));
  //   } else if (pageName == "message") {
  //     return Message.fromJson(json.encode(data));
  //   } else if (pageName == "handbook") {
  //     return Handbook.fromJson(json.encode(data));
  //   } else if (pageName == "whatsapptemplate") {
  //     return WhatsAppTemplate.fromJson(json.encode(data));
  //   } else if (pageName == "whatsappuser") {
  //     return WhatsAppUser.fromJson(json.encode(data));
  //   } else {
  //     return data;
  //   }
  // }

  // Future<ApiResponse> fetchList(String pageName, String baseObject,
  //     Map<String, dynamic> parameters) async {
  //   return await execApi(
  //       "App${pageName.toUpperCase()}List", baseObject, parameters);
  // }

  // dynamic fetchedList(String pageName, List list) {
  //   //List list = [];

  //   //if (response.resultSets.isNotEmpty) list = response.resultSets[0];
  //   if (pageName == "task") {
  //     return (list).map((i) => Task.fromMap(i)).toList().cast<Task>();
  //   } else if (pageName == "tasklog") {
  //     return (list).map((i) => TaskLog.fromMap(i)).toList().cast<TaskLog>();
  //   } else if (pageName == "lost") {
  //     return (list).map((i) => Lost.fromMap(i)).toList().cast<Lost>();
  //   } else if (pageName == "comment") {
  //     return (list).map((i) => Comment.fromMap(i)).toList().cast<Comment>();
  //   } else if (pageName == "survey") {
  //     return (list).map((i) => Comment.fromMap(i)).toList().cast<Comment>();
  //   } else if (pageName == "checklist") {
  //     return (list).map((i) => CheckList.fromMap(i)).toList().cast<CheckList>();
  //   } else if (pageName == "guest") {
  //     return (list).map((i) => Guest.fromMap(i)).toList().cast<Guest>();
  //   } else if (pageName == "guestselect") {
  //     return (list).map((i) => Guest.fromMap(i)).toList().cast<Guest>();
  //   } else if (pageName == "approval") {
  //     return (list).map((i) => Approval.fromMap(i)).toList().cast<Approval>();
  //   } else if (pageName == "callcenter") {
  //     return (list)
  //         .map((i) => CallCenter.fromMap(i))
  //         .toList()
  //         .cast<CallCenter>();
  //   } else if (pageName == "resource") {
  //     return (list)
  //         .map((i) => Reservation.fromMap(i))
  //         .toList()
  //         .cast<Reservation>();
  //   } else if (pageName == "roomrack") {
  //     return (list).map((i) => Roomrack.fromMap(i)).toList().cast<Roomrack>();
  //   } else if (pageName == "reminder") {
  //     return (list).map((i) => Reminder.fromMap(i)).toList().cast<Reminder>();
  //   } else if (pageName == "message") {
  //     return (list).map((i) => Message.fromMap(i)).toList().cast<Message>();
  //   } else if (pageName == "handbook") {
  //     return (list).map((i) => Handbook.fromMap(i)).toList().cast<Handbook>();
  //   } else if (pageName == "whatsapptemplate") {
  //     return (list)
  //         .map((i) => WhatsAppTemplate.fromMap(i))
  //         .toList()
  //         .cast<WhatsAppTemplate>();
  //   } else if (pageName == "whatsappuser") {
  //     return (list)
  //         .map((i) => WhatsAppUser.fromMap(i))
  //         .toList()
  //         .cast<WhatsAppUser>();
  //   } else if (pageName == "select") {
  //     return (list)
  //         .map((i) => SelectItem.fromMap(i))
  //         .toList()
  //         .cast<SelectItem>();
  //   }
  // }

  Future<int> insertApi(
      String tablename, Map<String, dynamic> insertData) async {
    ApiRequest insertRequest =
        ApiRequest(action: "Insert", object: tablename, row: insertData);
    ApiResponse response = await httpPost(insertRequest);
    if (response.success == true) {
      return response.primaryKey ?? 0;
    }
    return 0;
  }

  Future<int> updateApi(
      String tablename, Map<String, dynamic> updateData, int id) async {
    ApiRequest updateRequest =
        ApiRequest(action: "Update", object: tablename, row: updateData);
    ApiResponse response = await httpPost(updateRequest);

    if (response.success == true) {
      return response.primaryKey ?? 0;
    } else {
      return 0;
    }
  }

  Future<int> deleteApi(String tablename, int id) async {
    ApiRequest deleteRequest =
        ApiRequest(action: "Delete", object: tablename, keys: id.toString());
    ApiResponse response = await httpPost(deleteRequest);
    if (response.success == true) {
      return response.primaryKey ?? 0;
    } else {
      return 0;
    }
  }

  Future<dynamic> selectApi(String object,
      {List<String>? select,
      List<dynamic>? where,
      List<dynamic>? joins,
      List<dynamic>? orderBy,
      bool? totalCount,
      int? pageIndex,
      int? itemsPerPage}) async {
    ApiRequest selectRequest = ApiRequest(
        action: "Select",
        object: object,
        select: select ?? [],
        paging: {
          "Current": pageIndex ?? 1,
          "ItemsPerPage": itemsPerPage ?? 100
        },
        orderBy: orderBy ?? [],
        where: where ?? [],
        joins: joins ?? [],
        totalCount: totalCount);
    ApiResponse response = await httpPost(selectRequest);

    if (response.success) {
      return response.resultSets[0];
    } else {
      return [];
    }
  }

  Future<dynamic> byKeyApi(String tablename, int id,
      {String primaryKey = "ID"}) async {
    ApiRequest byKeyRequest =
        ApiRequest(action: "Select", object: tablename, paging: {
      "Current": 1,
      "ItemsPerPage": 1
    }, where: [
      {"Column": "ID", "Operator": "=", "Value": id}
    ]);
    ApiResponse response = await httpPost(byKeyRequest);
    if (response.success) {
      return response.resultSets[0][0];
    } else {
      return <String, dynamic>{};
    }
  }

  // Future getFcmToken() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   if (token != null) {
  //     StorageService.get().writeStorage(StorageKeys.registerId, token);
  //     debugPrint(token);
  //     Map<String, dynamic> parameters = {};
  //     parameters["TOKEN"] = token;
  //     parameters["PLATFORM"] = Platform.isIOS ? "IOS" : "ANDROID";
  //     parameters["TYPE"] = 1;

  //     execApi("AppToken", "STDUSER_FIREBASETOKEN", parameters);
  //   }
  // }

  Future<ApiResponse> httpPost(ApiRequest request) async {
    if (apiToken == "" || tenantId == 0 || companyId == 0) {
      // loginError();
      return ApiResponse(
          statusCode: 0,
          success: false,
          resultSets: [],
          message: "Login required");
    }

    if (request.action == "Execute" || request.action == "ApiSequence") {
      request.parameters?.putIfAbsent("COMPANYID", () => companyId);
      request.parameters?.putIfAbsent("TENANTID", () => tenantId);
      request.parameters?.putIfAbsent("RUSERID", () => box.userId);
      request.parameters?.putIfAbsent("LANGUAGE", () => box.languageCode);
    }

    // request.loginToken = box.token;
    return await httpPostNode(request, apiEndpoint);
  }

  Future<ApiResponse> httpPostNode(ApiRequest request, String url) async {
    // if (request.action == "Insert" || request.action == "Update") {
    //   request.row!["TENANTID"] = box.tenantId;
    // }

    // if (request.action == "Insert" ||
    //     request.action == "Update" ||
    //     request.action == "DELETE") {
    //   request.row?.putIfAbsent(
    //       "RUSER", () => box.userName == "" ? "OpexApp" : box.userName);
    //   request.row?.putIfAbsent("RDATE", () => DateTime.now());
    //   request.row?.putIfAbsent("TENANTID", () => box.tenantId);
    //   request.row?.putIfAbsent("COMPANYID", () => box.companyId);
    // }

    // if (request.action == "Select") {
    //   request.where
    //       ?.add({"Column": "TENANTID", "Operator": "=", "Value": box.tenantId});
    //   request.where?.add(
    //       {"Column": "COMPANYID", "Operator": "=", "Value": box.companyId});
    // }

    String postbody =
        json.encode(request.toMap(), toEncodable: myDateSerializer);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8"
    };

    try {
      http.Response response = await http
          .post(Uri.parse(url), headers: headers, body: postbody)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        // Closing client here throwns an error
        // client.close(); // Connection closed before full header was received
        return http.Response('Error', 500); // Replace 500 with your http code.
      });

      var responseObject = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        return parseSuccessResponse(request.action, responseObject);
      } else {
        return parseErrorResponse(response.statusCode, responseObject, url);
      }
    } catch (exp) {
      errorLog("HtppPost Error", exp.toString(), url);
      return ApiResponse(
          statusCode: 0,
          success: false,
          resultSets: [],
          message: exp.toString());
    }
  }

  ApiResponse parseSuccessResponse(String? requestType, var responseObject) {
    ApiResponse response = ApiResponse(
        success: true, statusCode: 200, message: "Ok", resultSets: []);

    if (requestType == "Execute") {
      response.resultSets = responseObject;
    } else if (requestType == "Select") {
      response.totalCount = toInt(responseObject["TotalCount"]);
      response.resultSets = responseObject["ResultSets"] ?? [];
    } else if (requestType == "ApiSequence") {
      response.row = responseObject ?? {};
    } else {
      response.primaryKey = toInt(responseObject["PrimaryKey"]);
      response.row = responseObject["Row"];
      response.rowsAffected = toInt(responseObject["RowsAffected"]);
    }
    return response;
  }

  Future<ApiResponse> parseErrorResponse(
      //error debug
      int statusCode,
      var responseObject,
      String url) async {
    ApiResponse response = ApiResponse(
        success: false,
        statusCode: statusCode,
        message: responseObject,
        resultSets: []);

    // if (url == "https://demonode.opex.app/") {
    //   // if (statusCode == 400 || statusCode == 404 || statusCode == 500) {
    //   //   errorLog("Api Error $statusCode", response.message ?? "", url);
    //   //   await showErrorDialog("Data Error", response.message ?? "Error");
    //   // } else if (statusCode == 401) {
    //   //   loginError();
    //   // } else if (statusCode == 403) {
    //   //   //errorLog("Permission Message $statusCode", response.message ?? "");
    //   //   showErrorDialog("Authorization", "You don't have permission!");
    //   // } else {
    //   //   errorLog("Api Error $statusCode", response.message ?? "", url);
    //   //   await showErrorDialog("Unknown Error", "");
    //   // }
    //   debugPrint(response.message);
    // } else {
    if (statusCode == 400 || statusCode == 404 || statusCode == 500) {
      errorLog("Api Error $statusCode", response.message ?? "", url);
      await showErrorDialog("Data Error", response.message ?? "Error");
    } else if (statusCode == 401) {
      // loginError();
    } else if (statusCode == 403) {
      //errorLog("Permission Message $statusCode", response.message ?? "");
      showErrorDialog("Authorization", "You don't have permission!");
    } else {
      errorLog("Api Error $statusCode", response.message ?? "", url);
      await showErrorDialog("Unknown Error", "");
    }
    //}
    return response;
  }

  errorLog(String errorCode, String errorMessage, String url) {
    Map<String, dynamic> insertData = {
      "LUSER": box,
      "ERR_CODE": errorCode,
      "ERR_MES": errorMessage,
      "LIP": null,
      "TENANTID": tenantId,
      "COMPANYID": companyId
    };

    ApiRequest insertRequest =
        ApiRequest(action: "Insert", object: "STDLOG_ERR", row: insertData);

    String postbody =
        json.encode(insertRequest.toMap(), toEncodable: myDateSerializer);

    http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: postbody);
  }
}

class ApiRequest {
  String? loginToken;
  String action;
  String object;
  String? baseObject;
  bool? totalCount;
  bool? dataTypes;
  Map? paging;
  List<dynamic>? orderBy;
  List<dynamic>? where;
  List<dynamic>? joins;
  Map? row;
  String? keys;
  Map<String, dynamic>? parameters;
  List<String>? select;

  ApiRequest(
      {this.loginToken,
      required this.action,
      required this.object,
      this.baseObject,
      this.totalCount = false,
      this.dataTypes = false,
      this.paging,
      this.orderBy,
      this.where,
      this.joins,
      this.row,
      this.keys,
      this.parameters,
      this.select});

  Map<String, dynamic> toMap() => {
        "LoginToken": loginToken,
        "Action": action,
        "Object": object,
        "BaseObject": baseObject,
        "TotalCount": totalCount,
        "DataTypes": dataTypes,
        "Paging": paging,
        "OrderBy": orderBy,
        "Where": where,
        "Joins": joins,
        "Row": row,
        "Keys": keys,
        "Parameters": parameters
      };
}

class ApiResponse {
  bool success;
  List<dynamic> resultSets;
  int? totalCount;
  String? message;
  int? rowsAffected;
  Map? row;
  int? primaryKey;
  int? statusCode;
  Map<String, dynamic>? body;

  ApiResponse(
      {required this.success,
      required this.resultSets,
      this.totalCount,
      this.message,
      this.rowsAffected,
      this.row,
      this.body,
      this.primaryKey,
      this.statusCode});

  // ApiResponse.fromJson(Map<String, dynamic> json) {
  //   success = json['success'] ;
  //   resultSets = json['resultSets'];
  //   totalCount = json['totalCount'];
  //   message = json['message'];
  //   rowsAffected = json["rowsAffected"];
  //   row= json["row"];
  // }
}

dynamic myDateSerializer(dynamic object) {
  if (object is DateTime) {
    return object.toIso8601String();
  }
  return object;
}

List<T> parseItemListFromJsonArray<T>(
  List<dynamic> jsonArray,
  T Function(dynamic object) mapper,
) =>
    jsonArray.map(mapper).toList();
