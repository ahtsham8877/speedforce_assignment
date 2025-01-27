import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../app/config/api_urls.dart';
import '../../presentation/global_widget/custom_snackbar.dart';
import '../../presentation/global_widget/snack_bar_taosts.dart';
import '../local_storage/auth_service.dart';



enum APIMethod { get, post, put, patch, delete }

class ApiManager {
  Future<dynamic> requestHttpAPi(String endPoint,
      {String baseUrl = ApiUrls.baseUrl,
      APIMethod method = APIMethod.post,
      Map<String, dynamic>? data,
      dynamic formData,
      bool isAuthenticated = true,
      bool isFormData = true}) async {
    final url = ApiUrls.baseUrl + endPoint;
    final uri = Uri.parse(url);
    debugPrint("URL : $url");
    debugPrint("Data : ${isFormData ? formData : data}");
    var headers = isFormData?{
      "Accept": "application/json",
      "Authorization": Get.find<AuthService>().apiToken.isEmpty
          ? ""
          : "Bearer ${Get.find<AuthService>().apiToken}"
    }:{
      "Accept": "application/json",
      'Content-type':"application/json",
      "Authorization": Get.find<AuthService>().apiToken.isEmpty
          ? ""
          : "Bearer ${Get.find<AuthService>().apiToken}"

    };
    print("Headers $headers");
    dynamic resStr;
    http.Response response;
    try {
      switch (method) {
        case APIMethod.get:
          response = await http
              .get(uri, headers: headers)
              .timeout(const Duration(seconds: 30));
          break;
        case APIMethod.post:
          response = await http.post(uri,
              headers: headers, body: isFormData ? formData : jsonEncode(data));
          break;
        case APIMethod.put:
          response = await http
              .put(uri,
                  headers: headers,
                  body: isFormData ? formData : jsonEncode(data))
              .timeout(const Duration(seconds: 30));
          break;
        case APIMethod.patch:
          response = await http
              .patch(uri,
                  headers: headers,
                  body: isFormData ? formData : jsonEncode(data))
              .timeout(const Duration(seconds: 30));
          break;
        case APIMethod.delete:
          response = await http
              .delete(uri, headers: headers, body: jsonEncode(data))
              .timeout(const Duration(seconds: 30));
          break;
      }
      debugPrint(
          "End Point: $endPoint Response Status CODE: ${response.statusCode}");
      debugPrint(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401) {
        debugPrint("$endPoint===> user token expired");
     /*   debugPrint("$endPoint===> user token expired");
        successSnackBar(title: "Session End", message: "Please login again");
        closeApplicationTimer();
        Get.find<AuthService>().removeCurrentUser();
        Get.offAllNamed(AppRoutes.login);*/
      } else if(response.statusCode == 404){
        debugPrint("No Data found");
      }else {
        try {
          var jsonData = jsonDecode(response.body);
          String message = jsonData["message"] ?? "";
          if (message.isNotEmpty) {
            customToastView(title: message);
          } else {
            customToastView(title: "Please try again");
            debugPrint("$endPoint===>No message found in api");
          }
        } catch (e) {
          customToastView(title: "Please try again");
          debugPrint("$endPoint===>exception in parsing body$e");
        }
      }
    } on SocketException {
      customToastView(title: 'No Internet Connection');
      debugPrint('End Point: $endPoint  No Internet connection 😑');
    } on TimeoutException catch (e) {
      customToastView(title: 'Api Response Timeout');
      debugPrint('End Point: $endPoint  Timeout Error: $e');
    } on HttpException catch (error) {
      debugPrint("End Point: $endPoint  Couldn't find the post 😱 $error");
    } on FormatException catch (error) {
      debugPrint("End Point: $endPoint  Bad response format 👎 $error");
    } catch (value) {
      debugPrint("End Point: $endPoint Exception in api request $value");
    }
    return resStr;
  }

  Future<dynamic> requestMultiPartAPi(
    String endPoint, {
    String baseUrl = ApiUrls.baseUrl,
    Map<String, String>? header,
    Map<String, dynamic>? fields,
    List<File>? files,
    List<String>? filesName,
  }) async {
    dynamic respStr;
    try {
      final url = ApiUrls.baseUrl + endPoint;
      debugPrint("URL : $url");
      var request = http.MultipartRequest('post', Uri.parse(url));
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] =
          Get.find<AuthService>().apiToken.isEmpty
              ? ""
              : "Bearer ${Get.find<AuthService>().apiToken}";
      if (header != null) {
        request.headers.addAll(header);
      }
      debugPrint("===headres>${request.headers}");
      if (fields != null) {
        // Add fields
        fields.forEach((key, value) {
          request.fields[key] = value;
        });
      }
      debugPrint("===fields>${request.fields}");
      if (files != null) {
        for (int i = 0; i < files.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
              filesName![i], files[i].path)); // Adjust field name as needed
        }
      }
      debugPrint("===fields>${request.files}");
      var response = await request.send();
      final responseData = await response.stream.toBytes();
      final respStr = String.fromCharCodes(responseData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return respStr;
      } else if (response.statusCode == 401) {
        debugPrint("$endPoint===> user token expired");
        successSnackBar(title: "Session End", message: "Please login again");
       /* closeApplicationTimer();
        Get.find<AuthService>().removeCurrentUser();
        Get.offAllNamed(AppRoutes.login);*/
      } else {
        try {
          var jsonData = jsonDecode(respStr);
          String message = jsonData["message"] ?? "";
          if (message.isNotEmpty) {
            customToastView(title: message);
          } else {
            customToastView(title: "Please try again");
            debugPrint("$endPoint===>No message found in api");
          }
        } catch (e) {
          customToastView(title: "Please try again");
          debugPrint("$endPoint===>exception in parsing body$e");
        }
      }
    } on SocketException {
      customToastView(title: 'No Internet Connection');
      debugPrint('No Internet connection 😑');
    } on HttpException catch (error) {
      debugPrint("Couldn't find the post 😱 $error");
    } on FormatException catch (error) {
      debugPrint("Bad response format 👎 $error");
    } catch (value) {
      debugPrint("Exception in api request $value");
    }
    return respStr;
  }
}


