import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';

class HorizontalSpacerBox extends StatelessWidget {
  const HorizontalSpacerBox({Key? key, required this.size}) : super(key: key);
  final SpacerSize size;
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    switch (size) {
      case SpacerSize.tiny:
        return SizedBox(
          width: widthScreen * 0.08, //kTinySize,
        );
      case SpacerSize.small:
        return SizedBox(
          width: widthScreen * 0.12, //kSmallSize,
        );
      case SpacerSize.medium: 
        return SizedBox(
          width: widthScreen * 0.16, //kMediumSize,
        );
      case SpacerSize.large:
        return SizedBox(
          width: widthScreen * 0.24, //kLargeSize,
        );
      case SpacerSize.huge:
        return SizedBox(
          width: widthScreen * 0.36, //kHugeSize,
        );
      default: return SizedBox(
        width: widthScreen * 0.12, //Default
      );
    }
  }
}