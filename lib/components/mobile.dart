// --- MOBILE VIEW ---
import 'package:flutter/material.dart';
import 'package:portfolio_website/components/footer_section.dart';
import 'package:portfolio_website/components/header_section.dart';
import 'package:portfolio_website/components/hero_section.dart';
import 'package:portfolio_website/components/project_section.dart';
import 'package:portfolio_website/components/skill_section.dart';

class PortfolioMobileView extends StatelessWidget {
  const PortfolioMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(isMobile: true),
            SizedBox(height: 60),
            HeroSection(isMobile: true),
            SizedBox(height: 80),
            SkillsSection(isMobile: true),
            SizedBox(height: 80),
            ProjectsSection(isMobile: true),
            SizedBox(height: 80),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}