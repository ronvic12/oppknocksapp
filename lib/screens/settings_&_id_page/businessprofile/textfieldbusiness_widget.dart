import 'package:flutter/material.dart';
//import 'dart:io';

import 'package:flutter/foundation.dart';

class BusinessFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const BusinessFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);
  @override
  BusinessFieldWidgetState createState() => BusinessFieldWidgetState();
}

class BusinessFieldWidgetState extends State<BusinessFieldWidget> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
        text: widget.text); // text field and able to put the text inside.
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: widget.maxLines, // controlling the text field.
            onChanged: widget.onChanged,
          ),
        ],
      );
}