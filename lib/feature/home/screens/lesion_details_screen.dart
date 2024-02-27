import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skin_lesion_detector/feature/home/controller/home_controller.dart';

class LesionDetailsScreen extends ConsumerWidget {
  const LesionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lesionDetailsData = ref.watch(homeControllerProvider.notifier).lesionDetailsModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesion Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "Lesion Type: ${lesionDetailsData?.result ?? "Not Found"}",
              style: const TextStyle(fontSize: 20, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text("Melanoma"),
                  subtitle: Text("${lesionDetailsData?.probabilities?.melanoma}"),
                ),
                ListTile(
                  title: const Text("Melanocytic Nevi"),
                  subtitle: Text("${lesionDetailsData?.probabilities?.melanocyticNevi}"),
                ),
                ListTile(
                  title: const Text("Dermatofibroma"),
                  subtitle: Text("${lesionDetailsData?.probabilities?.dermatofibroma}"),
                ),
                ListTile(
                  title: const Text("Basal Cell Carcinoma"),
                  subtitle: Text("${lesionDetailsData?.probabilities?.basalCellCarcinoma}"),
                ),
                ListTile(
                  title: const Text("Actinic Keratoses"),
                  subtitle: Text("${lesionDetailsData?.probabilities?.actinicKeratoses}"),
                ),
                ListTile(
                  title: const Text("Benign Keratosis Like Lesions"),
                  subtitle: Text("${lesionDetailsData?.probabilities?.benignKeratosisLikeLesions}"),
                ),
                ListTile(
                  title: const Text("Vascular Lesions"),
                  subtitle: Text("${lesionDetailsData?.probabilities?.vascularLesions}"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}