import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  final bool hideText;

  const AppTextField({
    super.key,
    required this.lable,
    required this.controller,
    this.hideText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label text with custom style
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            lable,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Icon color
              fontFamily: 'DMSerifText-Italic',
            ),
          ),
        ),
        // TextField with decorations
        TextField(
          controller: controller,
          obscureText: hideText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            // Add icon to the left of the text field (optional)
            prefixIcon: Icon(
              hideText
                  ? Icons.lock
                  : Icons.email, // Icon based on the field type
              color: Colors.white, // Icon color
            ),
            // Border decoration
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 17, 61, 48), // Border color
                width: 2, // Border width
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ), // Focused border color
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ).withOpacity(0.5), // Border color when not focused
                width: 1,
              ),
            ),
            // Placeholder text
            hintText: 'Enter your $lable',
            hintStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
