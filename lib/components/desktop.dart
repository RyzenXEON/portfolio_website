import 'package:flutter/material.dart';
import 'package:portfolio_website/components/footer_section.dart';
import 'package:portfolio_website/components/header_section.dart';
import 'package:portfolio_website/components/hero_section.dart';
import 'package:portfolio_website/components/particleanimation.dart';
import 'package:portfolio_website/components/project_section.dart';
import 'package:portfolio_website/components/skill_section.dart';

class PortfolioDesktopView extends StatelessWidget {
  const PortfolioDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            SizedBox(height: 80),
            // Two-column layout for Hero section + Animation
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3, // Give more space to text
                  child: HeroSection(),
                ),
                SizedBox(width: 60),
                Expanded(
                  flex: 2, // Give space to animation
                  child: SizedBox(
                    height: 400, // Define a height for the animation container
                    child: ParticleAnimationWidget(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            SkillsSection(),
            SizedBox(height: 100),
            ProjectsSection(),
            SizedBox(height: 100),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}