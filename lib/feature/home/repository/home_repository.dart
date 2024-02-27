import 'dart:io';
import 'package:skin_lesion_detector/network/api.dart';
import 'package:skin_lesion_detector/network/network_utils.dart';
import 'package:skin_lesion_detector/utils/debugger.dart';

class HomeRepository{
  Future<dynamic> fatchLesionType(File image) async {
    dynamic result;
    try {
      dynamic body = {
        "file": image
      };
      dynamic responseBody = await Network.handleResponse(await Network.getDiseaseDataRequest(API.baseUrl, body));

      if (responseBody != null) {
        result = responseBody;
      } else {
        result = "Something went wrong!";
      }
      return result;
    } catch (e) {
      debug(data: "Error: $e");
      return e.toString();
    }
  }
}