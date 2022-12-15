import "dart:convert";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/lookup_item_model.dart';
import '../utils/app_routes.dart';
import '../utils/configuration.dart';
import '../utils/utils.dart';
import 'storage_service.dart';

class ApiService extends GetxService {
  static ApiService get() => Get.find();

  final storage = Get.find<StorageService>();

  Future<ApiService> init() async {
    return this;
  }

  Future<dynamic> execApi(
      String spname, String baseobject, Map<String, dynamic> parameters,
      {bool auth = true}) async {
    ApiRequest execRequest = ApiRequest(
        action: "Execute",
        object: spname,
        baseObject: baseobject,
        parameters: parameters,
        loginToken: auth == false ? apiToken : "");
    ApiResponse response = await httpPost(execRequest);
    if (response.success) {
      return response.resultSets;
    } else {
      return [];
    }
  }

  Future<dynamic> fetchListApi(
      String spName, String baseObject, Map<String, dynamic> parameters) async {
    var listResponse =
        await ApiService.get().execApi(spName, baseObject, parameters);
    List list = [];
    if (listResponse.isNotEmpty) list = listResponse[0];
    if (list.isNotEmpty) {
      return list;
    } else {
      return [];
    }
  }

  // Future<dynamic> fetchListApiToken(String spName, String baseObject,
  //     Map<String, dynamic> parameters) async {
  //   var listResponse = await ApiService.get().execApi(
  //       spName, baseObject, parameters);
  //   List list = [];
  //   if (listResponse.isNotEmpty) list = listResponse[0];
  //   if (list.isNotEmpty) {
  //     return list;
  //   } else {
  //     return [];
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

  Future<bool> formInsert(
      String spName, String baseObject, Map<String, dynamic> formData,
      {bool auth = true}) async {
    debugPrint(formData.toString());
    List<dynamic> result =
        await execApi(spName, baseObject, formData, auth: auth);

    if (result.isNotEmpty) {
      if (result[0].isNotEmpty) {
        return true;
      }
    }
    return false;
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
      int? itemsPerPage,
      String? apiToken}) async {
    ApiRequest selectRequest = ApiRequest(
        action: "Select",
        loginToken: apiToken,
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
      return response.resultSets?[0];
    } else {
      return [];
    }
  }

  // Future<dynamic> selectApiToken(String object,
  //     {List<String>? select,
  //     List<dynamic>? where,
  //     List<dynamic>? joins,
  //     List<dynamic>? orderBy,
  //     bool? totalCount,
  //     int? pageIndex,
  //     int? itemsPerPage}) async {
  //   ApiRequest selectRequest = ApiRequest(
  //       action: "Select",
  //       object: object,
  //       select: select ?? [],
  //       paging: {
  //         "Current": pageIndex ?? 1,
  //         "ItemsPerPage": itemsPerPage ?? 100
  //       },
  //       orderBy: orderBy ?? [],
  //       where: where ?? [],
  //       joins: joins ?? [],
  //       totalCount: totalCount);
  //   ApiResponse response = await httpPost(selectRequest, apiToken);

  //   if (response.success) {
  //     return response.resultSets?[0];
  //   } else {
  //     return [];
  //   }
  // }

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
      return response.resultSets?[0][0];
    } else {
      return null;
    }
  }

  Future<bool> login(String email, String password, int tenantId) async {
    const CircularProgressIndicator();

    try {
      Map logindata = {
        "Action": "Login",
        "Usercode": email,
        "Password": password,
        "Tenant": tenantId
      };

      var posturl = "$apiEndpoint/login";
      String postBody = json.encode(logindata);
      Map<String, String> headers = {"Content-type": "application/json"};

      var authResult =
          await http.post(Uri.parse(posturl), headers: headers, body: postBody);

      if (authResult.statusCode == 200) {
        var postResult = json.decode(authResult.body);
        bool success = postResult["Success"];

        if (success) {
          String token = postResult["LoginToken"];
          String userCode = postResult["Usercode"];
          var tenancy = postResult["Tenancy"];

          String userId = toInt(tenancy["STDUSERID"]).toString();
          String email = tenancy["USEREMAIL"] ?? "";
          String userName = tenancy["USERNAME"] ?? "";
          int companyId = toInt(tenancy["COMPANYID"]);

          storage.clearStorage();
          storage.writeStorage("token", token);
          storage.writeStorage("tenantId", tenantId);
          storage.writeStorage("userId", userId);
          storage.writeStorage("userCode", userCode);
          storage.writeStorage("userName", userName);
          storage.writeStorage("email", email);
          storage.writeStorage("companyId", companyId);
          //storage.writeStorage("loginDate", DateTime.now().toUtc().to);
          return true;
        } else {
          showErrorDialog(
              "Login Failure", "Please check your mail and password.");
        }
      } else {
        showErrorDialog("General network failure", "Please try again later.");
      }
    } catch (e) {
      showErrorDialog("Network Error", "Error".trArgs([e.toString()]));
    }
    return false;
  }

  Future<bool> clientLogin(String phone, String password) async {
    final parameters = {
      "PHONE": phone,
      "PASSWORD": password,
    };
    var token = apiToken;
    //"appapi#1\$e8fb79d00f62768d896eb82dbd7b6255786c4ddc7fa9e0698139b7ff7c19722d6511de5382ca982b06c8ce0d46b33390d35ffb1e41ce2bf4bdca54e68940d3ff";

    ApiRequest execRequest = ApiRequest(
        action: "Execute",
        object: "SDClientAppClientLogin",
        baseObject: "CLIENT",
        parameters: parameters);

    execRequest.loginToken = token;

    String postbody =
        json.encode(execRequest.toMap(), toEncodable: myDateSerializer);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8"
    };

    const CircularProgressIndicator();
    http.Response response = await http.post(Uri.parse(apiEndpoint),
        headers: headers, body: postbody);

    var responseObject = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      if (responseObject.length > 0) {
        if (responseObject[0].length > 0) {
          var data = responseObject[0][0];
          int clientId = data["CLIENTID"];
          String clientName = data["CLIENTNAME"];

          storage.clientName = clientName;
          storage.clientId = clientId;
          storage.phone = phone;

          return true;
        } else {
          showErrorDialog(
              "Login Error", "Please check your phone number and password.");
          return false;
        }
      } else {
        showErrorDialog("Login Error", "Please check your entered data.");
        return false;
      }
    } else {
      showErrorDialog("Login Error", "Please check your entered data.");
      return false;
    }
  }

  Future<String> forgotPassword(String usercode, String tenantid) async {
    var body = jsonEncode({
      "Action": "Execute",
      "Object": "SP_EASYPMS_FORGOTPASSWORD",
      "Parameters": {"TENANTID": tenantid, "USERCODE": usercode}
    });

    final http.Response response = await http.post(
      Uri.parse(apiEndpoint),
      headers: ({
        "Content-Type": "application/json",
        "Referer": "app.elektraweb.com"
      }),
      body: body,
    );
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      return json.decode(body)[0][0]["EMAIL"];
    } else {
      String body = utf8.decode(response.bodyBytes);
      return body;
    }
  }

  Future<dynamic> httpPost(ApiRequest request) async {
    int tenantid = tenantId;
    if (tenantid == 0) {
      return parseErrorReponse(401, null);
    }

    int companyid = companyId;
    if (companyid == 0) {
      return parseErrorReponse(401, null);
    }

    if (request.loginToken == null || request.loginToken == "") {
      request.loginToken = apiToken;
      if (request.loginToken == "") {
        return parseErrorReponse(401, null);
      }
    }

    if (request.action == "Insert" || request.action == "Update") {
      request.row?["TENANTID"] = tenantid;
      request.row?["COMPANYID"] = companyid;
    }

    if (request.action == "Select") {
      request.where
          ?.add({"Column": "COMPANYID", "Operator": "=", "Value": companyid});
      request.where
          ?.add({"Column": "TENANTID", "Operator": "=", "Value": tenantid});
    }

    if (request.action == "Execute") {
      request.parameters?["COMPANYID"] = companyid;
      request.parameters?["TENANTID"] = tenantid;
      request.parameters?["RUSERID"] = storage.userId;
      request.parameters?["CLIENTID"] = storage.clientId;
      // TODO
      request.parameters?["LANGUAGE"] = 'tr'; //storage.lang;
    }

    const CircularProgressIndicator();
    var posturl = apiEndpoint;

    String postbody =
        json.encode(request.toMap(), toEncodable: myDateSerializer);
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8"
    };

    try {
      http.Response response =
          await http.post(Uri.parse(posturl), headers: headers, body: postbody);
      var responseObject = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        return parseSuccessResponse(request.action, responseObject);
      } else {
        return parseErrorReponse(response.statusCode, responseObject);
      }
    } catch (exp) {
      errorLog("HttpPost Error", exp.toString());
    }
  }

  ApiResponse parseSuccessResponse(String? requestType, var responseObject) {
    ApiResponse response = ApiResponse(success: true, statusCode: 200);

    response.success = true;
    response.message = "Ok";

    if (requestType == "Execute") {
      response.resultSets = responseObject ?? [];
    } else if (requestType == "Select") {
      response.totalCount = toInt(responseObject["TotalCount"]);
      response.resultSets = responseObject["ResultSets"] ?? [];
    } else {
      response.primaryKey = toInt(responseObject["PrimaryKey"]);
      response.row = responseObject["Row"];
      response.rowsAffected = toInt(responseObject["RowsAffected"]);
    }
    return response;
  }

  ApiResponse parseErrorReponse(int statusCode, var responseObject) {
    ApiResponse response = ApiResponse(statusCode: statusCode, success: false);

    response.success = false;
    response.message = responseObject;
    response.statusCode = statusCode;

    if (statusCode == 400 || statusCode == 404 || statusCode == 500) {
      errorLog("Api Error $statusCode", response.message ?? "");
      showErrorDialog("Data Error", response.message ?? "Error");
    } else if (statusCode == 401) {
      //showLoginDialog();
      //Get.toNamed(AppRoutes.LOGIN);
      showAlert("Login required");
      //showConfirmDialog("Authorization", "Login required", loginError);
    } else if (statusCode == 403) {
      //showLoginDialog();
      showErrorDialog("Authorization", response.message ?? "");
      //Get.toNamed(AppRoutes.LOGIN);
      //showAlert(response.message ?? "Error");
    } else {
      errorLog("Api Error $statusCode", response.message ?? "");
      showErrorDialog("Unknown Error", "");
    }
    return response;
  }

  errorLog(String errorCode, String errorMessage) {
    Map<String, dynamic> insertData = {
      "LUSER": storage.readStorage("userName"),
      "ERR_CODE": errorCode,
      "ERR_MES": errorMessage,
      "LIP": null,
      "TENANTID": 1,
      "COMPANYID": 1
    };
    ApiRequest insertRequest =
        ApiRequest(action: "Insert", object: "STDLOG_ERR", row: insertData);

    String postbody =
        json.encode(insertRequest.toMap(), toEncodable: myDateSerializer);

    http.post(Uri.parse(apiEndpoint),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: postbody);
  }

  postFormData(dynamic data, String route) async {
    Map<String, dynamic> formData = {};
    data.forEach((key, value) {
      formData[key] = value;
    });
    //print(formData);
    try {
      formData["RUSERID"] = await storage.readStorage("userId");
      formData["CLIENTID"] = await storage.readStorage("clientId");
      formData["RESERVATIONID"] = await storage.readStorage("reservationId");
      formData["ROOM"] = await storage.readStorage("room");
      formData["ROUTE"] = route;
      List<dynamic> response =
          await execApi("GuestAppCallsInsert", "CALLS", formData);
      checkExecResponse(response);
    } catch (err) {
      //print('Error: $err');
      errorLog("Postfrom Error", err.toString());
      Get.offNamed("/formError");
    }
  }

  checkExecResponse(List<dynamic>? response) {
    if (response != null) {
      if (response.isNotEmpty) {
        if (response[0][0]["ID"] > 0) {
          Get.offNamed("/formOk");
          return;
        }
      }
      Get.offNamed("/formError", arguments: response[0][0]["ERR_MESSAGE"]);
    }
    Get.offNamed("/formError");
  }

  checkListResponse(List<dynamic>? response) {
    if (response != null) {
      if (response.isNotEmpty) {
        if (response[0].length > 0) {
          return response[0];
        }
      }
    }
    return [];
  }

  Future<bool> guestPMSLogin(
      String? room, DateTime? bdate, String? email, String? password) async {
    Map<String, dynamic> params = {
      "ROOM": room,
      "BDATE": bdate,
      "EMAIL": email,
      "PASSWORD": password
    };

    List<dynamic> response =
        await execApi("GuestAppLogin", "OPEX_HOTEL_RESERVATION", params);
    List list = checkListResponse(response);
    if (list.isNotEmpty) {
      String? room = list[0]["ROOM"];
      String? firstName = list[0]["FIRSTNAME"];
      String? lastName = list[0]["LASTNAME"];
      String? clientName = list[0]["CLIENTNAME"];
      String? checkIn = list[0]["CHECKIN"];
      String? checkOut = list[0]["CHECKOUT"];
      int clientId = list[0]["CLIENTID"] ?? 0;
      int reservationId = list[0]["RESERVATIONID"] ?? 0;
      String? email = list[0]["EMAIL"];
      String? password = list[0]["PASSWORD"];
      String? phone = list[0]["PHONE"];
      String? bdate =
          list[0]["BDATE"]; //== null ? null : DateTime.parse(list[0]["BDATE"]);
      bool? member = list[0]["MEMBER"];
      int ruserId = 0;

      storage.writeStorage("room", room);
      storage.writeStorage("firstName", firstName);
      storage.writeStorage("lastName", lastName);
      storage.writeStorage("clientName", clientName);
      storage.writeStorage("checkIn", checkIn);
      storage.writeStorage("checkOut", checkOut);
      storage.writeStorage("clientId", clientId);
      storage.writeStorage("ruserId", ruserId);
      storage.writeStorage("reservationId", reservationId);
      storage.writeStorage("email", email);
      storage.writeStorage("phone", phone);
      storage.writeStorage("bdate", bdate);
      storage.writeStorage("password", password);
      storage.writeStorage("member", member);
      return true;
    } else {
      return false;
    }
  }

  Future checkLogin() async {
    String? room = storage.readStorage("room");
    DateTime? bdate = storage.readStorage("bdate") == null
        ? null
        : DateTime.parse(storage.readStorage("bdate"));
    String? email = storage.readStorage("email");
    String? password = storage.readStorage("password");

    var result = false;
    if ((room != null && bdate != null) ||
        (email != null && password != null)) {
      result = await guestPMSLogin(room, bdate, email, password);
    }

    if (result == false) {
      //showLoginDialog();
      Get.toNamed(AppRoutes.login);
    }
  }

  Future<List<LookupItem>> lookupItems(String table, String field,
      {List<dynamic>? where, List<dynamic>? orderBy, bool auth = true}) async {
    final List<LookupItem> itemList = [];
    var list = await selectApi(table,
        select: ["ID", field],
        where: where,
        orderBy: orderBy ??
            [
              {"Column": field}
            ],
        itemsPerPage: 1000);
    if (list != null) {
      for (var i = 0; i < list.length; i++) {
        itemList.add(LookupItem(list[i]["ID"], list[i][field]));
      }
    }
    return itemList;
  }

  Future<List<LookupItem>> lookupAppItems(String form) async {
    final List<LookupItem> itemList = [];
    var list = await execApi(
        "GuestAppSubjectList", "GUESTAPP_SUBJECT_LIST", {"FORM": form},
        auth: false);
    if (list.isNotEmpty) {
      for (var i = 0; i < list[0].length; i++) {
        itemList.add(
            LookupItem(list[0][i]["SUBJECTID"], list[0][i]["DESCRIPTION"]));
      }
    }
    return itemList;
  }

  Future<List<String>> stdLookupItems(String field) async {
    final List<String> itemList = [];
    var list = await selectApi("STDLOOKUP",
        where: [
          {"Column": "LOOKUPTABLE", "Operator": "=", "Value": field}
        ],
        itemsPerPage: 1000);
    if (list != null) {
      for (var i = 0; i < list.length; i++) {
        itemList.add(list[i]["LOOKUPVALUE"]);
      }
    }
    return itemList;
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
  List<dynamic>? resultSets;
  int? totalCount;
  String? message;
  int? rowsAffected;
  Map? row;
  int? primaryKey;
  int? statusCode;

  ApiResponse(
      {required this.success,
      this.resultSets,
      this.totalCount,
      this.message,
      this.rowsAffected,
      this.row,
      required this.statusCode,
      this.primaryKey});
}

dynamic myDateSerializer(dynamic object) {
  if (object is DateTime) {
    return object.toIso8601String();
  }
  return object;
}
