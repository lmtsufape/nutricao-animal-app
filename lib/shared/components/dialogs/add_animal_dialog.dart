import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

class DialogAddAnimal extends StatelessWidget {
  const DialogAddAnimal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Adicionar Animal',
        style: TextStyle(
          color: kText,
          fontSize: 20,
        ),
      ),
      content: const Text(
        'Animal adicionado com sucesso!',
        style: TextStyle(
          color: kText,
          fontSize: 15,
        ),
      ),
      actions: [
        Center(
          child: Wrap(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, Screens.home);
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'Eba!',
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDetailColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
