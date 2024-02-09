import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

void debug({required dynamic data, Level? logLevel}) {
  if (kDebugMode) {
    Logger().log(logLevel ?? Level.warning, data);
  }
}
