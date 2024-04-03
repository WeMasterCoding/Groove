import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String fieldName;
  final Icon icon;
  final String hintText;

  final TextEditingController controller;

  const InputField(
      {super.key,
        required this.fieldName,
        required this.icon,
        this.hintText = '',
        required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 17.0,
            ),
          ),
          //
          TextField(
            controller: controller,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
            decoration: InputDecoration(
              suffixIcon: icon,
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Colors.white38,
              ),
            ),
          )
        ],
      ),
    );
  }
}