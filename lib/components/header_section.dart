import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/theme.dart';

class HeaderSection extends StatelessWidget {
  final bool isMobile;
  const HeaderSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Supragya Sharma',
          style: GoogleFonts.cinzel(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
            color: kAccentColor,
          ),
        ),
      ],
    );
  }
}