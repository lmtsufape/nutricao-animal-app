import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key});

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  final AppTheme formCustom = AppTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: formCustom.appBarCustom(context),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
