import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/theme.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;
  const HeroSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center, // Center text vertically
      children: [
        Text(
          "Hi, I'm Supragya,",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 32 : 56,
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 24 : 40,
              fontWeight: FontWeight.w600,
              color: kTextSecondaryColor,
              height: 1.2,
            ),
            children: const [
              TextSpan(text: 'A Cloud & Software Engineer\n'),
              TextSpan(
                text: 'specializing in modern cloud solutions.',
                style: TextStyle(color: kAccentColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "B.Tech in Computer Science with a specialization in Cloud Computing. \nI build scalable, efficient, and robust applications on the cloud.",
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: kTextSecondaryColor,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}