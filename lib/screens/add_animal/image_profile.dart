import 'package:flutter/material.dart';

import 'package:thunderapp/components/utils/horizontal_spacer_box.dart';
import 'package:thunderapp/screens/add_animal/add_animal_controller.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';


class ImageProfile extends StatefulWidget {
  late AddAnimalController controller;

  ImageProfile(this.controller, {super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: SizedBox(
        width: widthScreen * 0.4,
        height: heightScreen * 0.12,
        child: FloatingActionButton(
            heroTag: 'Photo',
            backgroundColor: kBackgroundColor,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(widget.controller)));
            },
            child: CircleAvatar(
                radius: 62,
                backgroundColor: kBackgroundColor,
                backgroundImage: widget.controller.selectedImage != null
                    ? FileImage(widget.controller.selectedImage!) 
                    : null,
                child: widget.controller.selectedImage == null
                    ? const Icon(
                        Icons.photo,
                        color: kSecondaryColor,
                        size: 50,
                      )
                    : null)),
      ),
    );
  }
}

Widget bottomSheet(AddAnimalController controller) {
  AddAnimalController _controller = controller;
  return Container(
    height: 100.0,
    width: 100,
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: <Widget>[
        const Text(
          "Escolha a foto do animal",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ElevatedButton.icon(
            icon: const Icon(Icons.camera),
            onPressed: () {
              _controller.selectImageCam();
            },
            label: const Text("Camera"),
          ),
          const HorizontalSpacerBox(size: SpacerSize.small),
          ElevatedButton.icon(
            icon: const Icon(Icons.image),
            onPressed: () {
              _controller.selectImage();
            },
            label: const Text("Gallery"),
          ),
        ])
      ],
    ),
  );
}
