import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KButton extends ConsumerWidget {
  final String? title;
  final Function()? onPressedCallback;
  final double innerPadding, borderRadius, rightLeftPadding;
  final Color? color;
  final Color? borderColor;
  final Color textColor;
  final bool isOutlineButton;
  final bool hasTrailngTitleIcon;
  final Icon? leadingTitleIcon;
  final Icon? trailingTitleIcon;
  final TextOverflow textOverflow;
  final TextStyle? textStyle;
  final double? height, width;

  const KButton({super.key, this.title, this.onPressedCallback, this.innerPadding = 10, this.borderRadius = 10, this.rightLeftPadding = 0, this.color, this.borderColor, this.textColor = Colors.white, this.isOutlineButton = false, this.hasTrailngTitleIcon = false, this.leadingTitleIcon, this.trailingTitleIcon, this.textOverflow = TextOverflow.ellipsis, this.textStyle, this.height = 50, this.width = 150});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onPressedCallback,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            title!,
            style: textStyle,
            overflow: textOverflow,
          ),
        ),
      ),
    );
  }
}