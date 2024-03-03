import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skin_lesion_detector/core/global_components/buttons/k_button.dart';
import 'package:skin_lesion_detector/core/services/message_services/toast_service.dart';
import 'package:skin_lesion_detector/feature/home/controller/home_controller.dart';
import 'package:skin_lesion_detector/feature/home/screens/lesion_details_screen.dart';
import 'package:skin_lesion_detector/utils/states/base_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedImageState = ref.watch(homeControllerProvider);
    final resultState = ref.watch(homeControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Lesion Detector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(resultState is SuccessState)
            ...[
           Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.deepPurple, width: 2),
              ),
              child: Center(
                child: Text(
                  "${ref.watch(homeControllerProvider.notifier).lesionType}",
                  style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                ),
              )
            ),
            const SizedBox(height: 20),
            KButton(
              title: "See details",
              onPressedCallback: ()async{
                Navigator.push(context, CupertinoPageRoute(builder: (context)=> const LesionDetailsScreen()));
              },
              color: Colors.deepPurple,
              textStyle: const TextStyle(fontSize: 16, color: Colors.white),
            )
            ],
            const SizedBox(height: 20,),
            if(selectedImageState is ImageCapturedState)
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepPurple, width: 2),
                ),
                child: ClipRRect( 
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(ref.watch(homeControllerProvider.notifier).takenImage!, fit: BoxFit.cover))
              ),
            const SizedBox(height: 20),
            KButton(
              title: "Take a picture",
              onPressedCallback: ()async{
                await ref.watch(homeControllerProvider.notifier).takePicuture();
              },
              color: Colors.deepPurple,
              textStyle: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 20),
            KButton(
              title: "Upload a picture",
              onPressedCallback: ()async{
                await ref.watch(homeControllerProvider.notifier).takePicuture(uploadImage: true);
              },
              color: Colors.deepPurple,
              textStyle: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 50),
            KButton(
              title: "Check",
              onPressedCallback: ()async{
                if(ref.watch(homeControllerProvider.notifier).takenImage == null){
                  ToastService.customToast("Please take or upload a picture first!");
                }
                await ref.watch(homeControllerProvider.notifier).fatchLesionType();
              },
              color: Colors.deepPurple,
              textStyle: const TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
