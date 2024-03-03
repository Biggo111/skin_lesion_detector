import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skin_lesion_detector/utils/debugger.dart';
import 'package:skin_lesion_detector/utils/states/base_state.dart';

final dataStoreServiceProvider = StateNotifierProvider<DataStoreService,BaseState>((ref){
  return DataStoreService(ref: ref);
});

class DataStoreService extends StateNotifier<BaseState>{
  final Ref? ref;
  DataStoreService({this.ref}) : super(const InitialState());

  Future<void>storeData({lesionType, takenImage})async{
   FirebaseFirestore firestore = FirebaseFirestore.instance;
   Reference referencePath = FirebaseStorage.instance.ref();
    try{
      Reference referenceImageDir = referencePath.child("lesion_image_data");
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      await referenceImageDir.child(uniqueFileName).putFile(takenImage);
      final imageUrl = await referenceImageDir.child(uniqueFileName).getDownloadURL();
      await firestore.collection("Data").doc().set({
        "lesionType": lesionType,
        "imageUrl": imageUrl,
        "time": DateTime.now()
      });
    }catch (e){
      debug(data: "Error in storing data: $e");
    }
  }
}