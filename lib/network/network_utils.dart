import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skin_lesion_detector/core/services/message_services/toast_service.dart';
import 'package:skin_lesion_detector/network/api.dart';

class Network{
  static postRequest(String endpoint, body)async{
    if(await isNetworkAvailable()){
      var headers = {
        'Content-type': 'multipart/form-data'
      };
      var url = API.baseUrl + endpoint;
      Response response =
          await post(Uri.parse(url), body: jsonEncode(body), headers: headers);
      return response;
    }else{
      ToastService.customToast("Check your connection!", bgColor: Colors.red);
    }
  }

  static getDiseaseDataRequest(String endpoint, body)async{
    if(await isNetworkAvailable()){
      var headers = {
        'Content-type': 'multipart/form-data'
      };
      var url = API.baseUrl + endpoint;
      Response response =
          await post(Uri.parse(url), body: jsonEncode(body), headers: headers);
      return response;
    }else{
      ToastService.customToast("Check your connection!", bgColor: Colors.red);
    }
  }


  static handleResponse (Response response)async{
    if(!await isNetworkAvailable()){
      ToastService.customToast("Check your connection!", bgColor: Colors.red);
    } else if(response.statusCode >= 200 && response.statusCode <= 210) {
      if (response.body.isNotEmpty) {
        try {
          return json.decode(response.body);
        } catch (e) {
          //return Failure(response: response.body, code: 400);
        }
      } else {
        //return Failure(response: response.body, code: 400);
      }
    } else {
      ToastService.customToast("Something went wrong!", bgColor: Colors.red);
    }
  }

}