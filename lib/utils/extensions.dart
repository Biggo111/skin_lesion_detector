import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension KeyExtensions on GlobalKey {
  Offset get widgetOffset {
    final renderBox = currentContext!.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  Size get widgetSize {
    final renderBox = currentContext!.findRenderObject() as RenderBox;
    return renderBox.size;
  }

  Offset get widgetPositionOffset {
    final renderBox = currentContext?.findRenderObject();
    var translation = renderBox?.getTransformTo(null).getTranslation();
    if (renderBox != null && translation != null) {
      return renderBox.paintBounds
          .shift(Offset(translation.x, translation.y))
          .center;
    } else {
      return widgetOffset;
    }
  }

  Rect? get widgetPositionRect {
    final renderBox = currentContext?.findRenderObject();
    var translation = renderBox?.getTransformTo(null).getTranslation();

    return renderBox?.paintBounds
        .shift(Offset(translation?.x ?? 0, translation?.y ?? 0));
  }
}

extension ContextExtensions on BuildContext {
  Size get screenSize {
    return MediaQuery.of(this).size;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  Orientation get screenOrientation {
    return MediaQuery.of(this).orientation;
  }

  Future push(Widget widget, {isMaterialRoute = false, isReplacement = false}) {
    return isReplacement
        ? Navigator.pushReplacement(
            this,
            isMaterialRoute
                ? MaterialPageRoute(builder: (context) => widget)
                : CupertinoPageRoute(builder: (context) => widget),
          )
        : Navigator.push(
            this,
            isMaterialRoute
                ? MaterialPageRoute(builder: (context) => widget)
                : CupertinoPageRoute(builder: (context) => widget),
          );
  }

  void pop() {
    return Navigator.pop(this);
  }
}

extension DurationExtensions on Duration {
  String printDuration() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.abs().remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.abs().remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension SizedBoxExtension on num {
  SizedBox get heightGap => SizedBox(height: toDouble());
  SizedBox get widthGap => SizedBox(width: toDouble());
}