import 'package:image_picker/image_picker.dart';
import 'package:skin_lesion_detector/network/api.dart';
import 'package:skin_lesion_detector/network/network_utils.dart';

class HomeRepository{
  Future<String> fatchLesionType(XFile image) async {
    dynamic result;
    try {
      dynamic responseBody = await Network.handleResponse(await Network.getDiseaseDataRequest(API.baseUrl, image));
      return result;
    } catch (e) {
      return e.toString();
    }
  }
}