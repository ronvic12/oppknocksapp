
import 'dart:io';

import 'package:flutter/material.dart';


class AthleteProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const AthleteProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
       child:Stack(
        children: [
          buildImage(),
          /*
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          )
          */
        ],
      ),);
    
  }

  Widget buildImage() {
    final image = imagePath.contains('https://')?NetworkImage(imagePath):FileImage(File(imagePath)); // have if else statement where it contains locally, and network.
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image
              as ImageProvider, // this image displays from the network image
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          // for flash effect
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8, // pixels
          child: Icon(isEdit ? Icons.add_a_photo : Icons.edit,
              color: Colors.white, size: 20),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
