import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_lesion_detector/core/services/asset_services.dart';
import 'package:skin_lesion_detector/core/services/data_store_service.dart';
import 'package:skin_lesion_detector/feature/home/repository/home_repository.dart';
import 'package:skin_lesion_detector/model/lesion_details_model.dart';
import 'package:skin_lesion_detector/utils/debugger.dart';
import 'package:skin_lesion_detector/utils/states/base_state.dart';

final homeControllerProvider = StateNotifierProvider<HomeController, BaseState>((ref) {
  return HomeController(ref: ref);
});

class HomeController extends StateNotifier<BaseState>{
  final Ref? ref;
  File? takenImage;
  String? lesionType;
  Map<String, dynamic>? resultPercentage;
  LesionDetailsModel? lesionDetailsModel;
  HomeController({this.ref}) : super(const InitialState());

  HomeRepository homeRepository = HomeRepository();

  DataStoreService dataStoreService = DataStoreService();


  Future takePicuture({uploadImage=false})async{
    debug(data: "Take picture");
    final imageForCheckup = await AssetServices.pickImage(uploadImage ? ImageSource.gallery : ImageSource.camera);

    debug(data: "Image for checkup: $imageForCheckup");

    if(imageForCheckup != null){
      takenImage = File(imageForCheckup.path);
      state = const ImageCapturedState();
    }
    
  }

  Future fatchLesionType()async{
    state = const LoadingState();
    final result = await homeRepository.fatchLesionType(takenImage!);
    lesionType = result['result'];
    resultPercentage = result['probabilities'];
    lesionDetailsModel = LesionDetailsModel.fromJson(result);
    if(lesionType != null){
      state = const SuccessState();
      dataStoreService.storeData(lesionType: lesionType, takenImage: takenImage);
    }
  }

  checkValidity(){
    double highest = 0;
    if(lesionDetailsModel != null){
      if(lesionDetailsModel!.probabilities!.melanoma! > highest){
      highest = lesionDetailsModel!.probabilities!.melanoma!;
    }
    if(lesionDetailsModel!.probabilities!.melanocyticNevi! > highest){
      highest = lesionDetailsModel!.probabilities!.melanocyticNevi!;
    }
    if(lesionDetailsModel!.probabilities!.dermatofibroma! > highest){
      highest = lesionDetailsModel!.probabilities!.dermatofibroma!;
    }
    if(lesionDetailsModel!.probabilities!.basalCellCarcinoma! > highest){
      highest = lesionDetailsModel!.probabilities!.basalCellCarcinoma!;
    }
    if(lesionDetailsModel!.probabilities!.actinicKeratoses! > highest){
      highest = lesionDetailsModel!.probabilities!.actinicKeratoses!;
    }
    if(lesionDetailsModel!.probabilities!.benignKeratosisLikeLesions! > highest){
      highest = lesionDetailsModel!.probabilities!.benignKeratosisLikeLesions!;
    }
    if(lesionDetailsModel!.probabilities!.vascularLesions! > highest){
      highest = lesionDetailsModel!.probabilities!.vascularLesions!;
    }
    }
    if(highest<0.5){
      return true;
    }
    return false;
  }

  reset(){
    state = const InitialState();
  }

}