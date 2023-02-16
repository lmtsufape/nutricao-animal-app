import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../screens/add_animal/add_animal_controller.dart';
import '../../shared/constants/style_constants.dart';

class DropDownCustom extends StatefulWidget {
  final String _labelDrop;
  final List<String> dropChoices;
  final int index;

  //construtor
  const DropDownCustom(this.dropChoices, this._labelDrop, this.index,
      {super.key});

  @override
  State<DropDownCustom> createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  final AddAnimalController _controller = AddAnimalController();
  String? _breed;
  final dropValue = ValueNotifier('');

  String? get breed => _breed;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(dropValue.value.toString());
    }
    final heightScreen = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 98,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget._labelDrop,
              style: TextStyle(
                  color: kSecondaryColor, fontSize: heightScreen * 0.016),
            ),
            ValueListenableBuilder(
                valueListenable: dropValue,
                builder: (BuildContext context, String value, _) {
                  return DropdownButtonFormField<String>(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: kDetailColor,
                        size: heightScreen * 0.040,
                      ),
                    ),
                    hint: Text(
                      'Selecione',
                      style: TextStyle(fontSize: heightScreen * 0.020),
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6))),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (String? choice) {
                      setState(() {
                        dropValue.value = choice.toString();
                        _breed = _controller.setBreed(widget.index, value);
                      });
                    },
                    items: widget.dropChoices
                        .map(
                          (choice) => DropdownMenuItem(
                            value: choice,
                            child: Text(choice),
                          ),
                        )
                        .toList(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
