import 'dart:io';

import 'package:flutter/material.dart';

class BusinessProfileWidget extends StatelessWidget {
  final String businessimagePath;
  final bool businessEdit;
  final VoidCallback businessonClicked;

  const BusinessProfileWidget({
    Key? key,
    required this.businessimagePath,
    this.businessEdit = false,
    required this.businessonClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildbusinessImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildbusinessIcon(color),
          ),
        ],
      ),
    );
  }

// might have few changes later.
  Widget buildbusinessImage() {
    // from the preferences page
    final bImage = businessimagePath.contains('https://')?NetworkImage(businessimagePath):FileImage(File(businessimagePath));
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: bImage as ImageProvider,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: businessonClicked),
        ),
      ),
    );
  }

  Widget buildbusinessIcon(Color color) => buildbusinessCircle(
        color: Colors.white,
        all: 3,
        child: buildbusinessCircle(
          color: color,
          all: 8, // pixels
          child: Icon(businessEdit ? Icons.add_a_photo : Icons.edit,
              color: Colors.white, size: 20),
        ),
      );

  Widget buildbusinessCircle({
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
