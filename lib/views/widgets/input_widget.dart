import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key, required this.label, required this.controller, required this.obscureText,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: TextField(
        
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: GoogleFonts.inter(),
            border: OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.black)
            ),
            labelText: label,
          ),
        ),
      ),
    );
  }
}
