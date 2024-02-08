import 'package:flutter/material.dart';
import 'package:skin_lesion_detector/utils/extensions.dart';

class KSize {
  static double getWidth(BuildContext context, width) {
    double _width = (((100 / 375) * width) / 100) * context.screenWidth;
    return _width;
  }

  static double getHeight(BuildContext context, height) {
    double _height = (((100 / 812) * height) / 100) * context.screenHeight;
    return _height;
  }
}