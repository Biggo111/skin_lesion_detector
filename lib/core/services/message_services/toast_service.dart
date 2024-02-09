import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ToastService{
 static customToast(String message, {Color? bgColor}) {
    return toast(message, bgColor: bgColor, length: Toast.LENGTH_LONG);
  }
}