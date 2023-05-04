import 'package:thunderapp/components/utils/horizontal_spacer_box.dart';
import 'package:thunderapp/screens/add_animal/add_animal_repository.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeleteAnimalDialog extends StatelessWidget {
  int id;
  DeleteAnimalDialog(this.id, {Key? key}) : super(key: key);

  AddAnimalRepository controller = AddAnimalRepository();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Excluir animal?',
        style: TextStyle(
          color: kText,
          fontSize: 20,
        ),
      ),
      content: const Text(
        'Você tem certeza que deseja excluir este animal?',
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
                  Navigator.pop(context);
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ElevatedButton(
                  onPressed: () {
                    controller.deleteAnimal(context, id);
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Excluir',
                    style: TextStyle(
                      color: kBackgroundColor,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
