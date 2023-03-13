import 'package:flutter/material.dart';

import '../../shared/constants/style_constants.dart';

enum Castrated { yes, no }

class CastratedWidget extends StatefulWidget {
  const CastratedWidget({super.key});

  @override
  State<CastratedWidget> createState() => _CastratedWidgetState();
}

class _CastratedWidgetState extends State<CastratedWidget> {
  Castrated? _castratedAnimal = Castrated.yes;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: ListTile(
            title: Text(
              'Sim',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: heightScreen * 0.020),
            ),
            leading: Transform.scale(
              scale: 2,
              child: Radio<Castrated>(
                activeColor: kDetailColor,
                value: Castrated.yes,
                groupValue: _castratedAnimal,
                onChanged: (Castrated? value) {
                  setState(() {
                    _castratedAnimal = value;
                  });
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            title: Text(
              'Não',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: heightScreen * 0.020),
            ),
            leading: Transform.scale(
              scale: 2,
              child: Radio<Castrated>(
                value: Castrated.no,
                activeColor: kDetailColor,
                groupValue: _castratedAnimal,
                onChanged: (Castrated? value) {
                  setState(() {
                    _castratedAnimal = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
