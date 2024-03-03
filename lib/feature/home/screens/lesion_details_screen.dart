import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skin_lesion_detector/feature/home/controller/home_controller.dart';

class LesionDetailsScreen extends ConsumerWidget {
  const LesionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lesionDetailsData = ref.watch(homeControllerProvider.notifier).lesionDetailsModel;
    final basalCellCarcinomaResult = ((lesionDetailsData?.probabilities?.basalCellCarcinoma)!*100).toStringAsFixed(1);
    final melanomaResult = ((lesionDetailsData?.probabilities?.melanoma)!*100).toStringAsFixed(1);
    final melanocyticNeviResult = ((lesionDetailsData?.probabilities?.melanocyticNevi)!*100).toStringAsFixed(1);
    final dermatofibromaResult = ((lesionDetailsData?.probabilities?.dermatofibroma)!*100).toStringAsFixed(1);
    final actinicKeratosesResult = ((lesionDetailsData?.probabilities?.actinicKeratoses)!*100).toStringAsFixed(1);
    final benignKeratosisLikeLesionsResult = ((lesionDetailsData?.probabilities?.benignKeratosisLikeLesions)!*100).toStringAsFixed(1);
    final vascularLesionResult = ((lesionDetailsData?.probabilities?.vascularLesions)!*100).toStringAsFixed(1);

    final checkingValidity = ref.watch(homeControllerProvider.notifier).checkValidity();
    

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
              "Lesion Type: ${lesionDetailsData?.result}",
              style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Divider(),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text("Melanoma"),
                  subtitle: Text("$melanomaResult %"),
                ),
                ListTile(
                  title: const Text("Melanocytic Nevi"),
                  subtitle: Text("$melanocyticNeviResult %"),
                ),
                ListTile(
                  title: const Text("Dermatofibroma"),
                  subtitle: Text("$dermatofibromaResult %"),
                ),
                ListTile(
                  title: const Text("Basal Cell Carcinoma"),
                  subtitle: Text(basalCellCarcinomaResult),
                ),
                ListTile(
                  title: const Text("Actinic Keratoses"),
                  subtitle: Text("$actinicKeratosesResult %"),
                ),
                ListTile(
                  title: const Text("Benign Keratosis Like Lesions"),
                  subtitle: Text("$benignKeratosisLikeLesionsResult %"),
                ),
                ListTile(
                  title: const Text("Vascular Lesions"),
                  subtitle: Text("$vascularLesionResult %"),
                ),
              ],
            ),
            const Divider(),
            checkingValidity ? const Text("The image you uploaded is not valid!", style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),) : const Text("Please contact a skin disease specialist", style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}