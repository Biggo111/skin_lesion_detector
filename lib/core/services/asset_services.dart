import 'package:image_picker/image_picker.dart';

class AssetServices{
  static pickImage(imageSourse) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: imageSourse);

    return image;
  }
}