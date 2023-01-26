import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class ErrorDialog extends StatelessWidget {
  final String mensage;
  const ErrorDialog({Key? key, required this.mensage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          mensage,
          style: const TextStyle(
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
                    'Ok',
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
        ]);
  }
}
