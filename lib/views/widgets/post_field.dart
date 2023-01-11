import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostField extends StatelessWidget {
  const PostField({
    Key? key, required this.hintText, required this.controller,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        // borderRadius: const BorderRadius.only(
        //   bottomLeft: Radius.circular(50),
        //   bottomRight: Radius.circular(50)
        // )
      ),
      child:  TextField(
        style: GoogleFonts.inter(),
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)),
      ),
    );
  }
}
