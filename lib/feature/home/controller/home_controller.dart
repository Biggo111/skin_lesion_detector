import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_lesion_detector/core/services/asset_services.dart';
import 'package:skin_lesion_detector/feature/home/repository/home_repository.dart';
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
  HomeController({this.ref}) : super(const InitialState());

  HomeRepository homeRepository = HomeRepository();


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
    if(lesionType != null){
      state = const SuccessState();
    }
  }

}