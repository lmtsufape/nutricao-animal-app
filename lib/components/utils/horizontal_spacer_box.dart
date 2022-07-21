import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';

class HorizontalSpacerBox extends StatelessWidget {
  const HorizontalSpacerBox({Key? key, required this.size}) : super(key: key);
  final SpacerSize size;
  @override
  Widget build(BuildContext context) {
    switch (size) {
      case SpacerSize.tiny:
        return const SizedBox(
          width: kTinySize,
        );
      case SpacerSize.small:
        return const SizedBox(
          width: kSmallSize,
        );
      case SpacerSize.medium: 
        return const SizedBox(
          width: kMediumSize,
        );
      case SpacerSize.large:
        return const SizedBox(
          width: kLargeSize,
        );
      case SpacerSize.huge:
        return const SizedBox(
          width: kHugeSize,
        );
      default: return const SizedBox(
        width: kSmallSize,
      );
    }
  }
}