import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_lesion_detector/core/global_components/buttons/k_button.dart';
import 'package:skin_lesion_detector/core/services/asset_services.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Lesion Detector'),
      ),
      body: Center(
        child: Column(
          children: [
            KButton(
              title: "Take a picture",
              onPressedCallback: () async{
                
               XFile imageForCheckup = await AssetServices.pickImage(ImageSource.camera);
                
              },
              color: Colors.deepPurple,
              textColor: Colors.white,
              textStyle: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
