import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeaderText extends StatelessWidget {
  final String title;
  const SectionHeaderText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
