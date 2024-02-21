import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:skin_lesion_detector/network/api.dart';
import 'package:skin_lesion_detector/network/network_utils.dart';

class HomeRepository{
  Future<String> fatchLesionType(File image) async {
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
      return e.toString();
    }
  }
}