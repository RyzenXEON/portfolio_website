import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/theme.dart';


class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      print('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Let's Connect",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: kAccentColor,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            "Feel free to reach out for collaborations or just a friendly hello!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: kTextSecondaryColor.withOpacity(0.8),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: SelectableText(
              "supragyasharma.dev@email.com", // Replace with your email
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.link), // Placeholder for LinkedIn
              onPressed: () =>
                  _launchURL('https://linkedin.com/in/your-profile'),
              iconSize: 30,
              color: kTextSecondaryColor,
              tooltip: 'LinkedIn',
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.code), // Placeholder for GitHub
              onPressed: () => _launchURL('https://github.com/your-username'),
              iconSize: 30,
              color: kTextSecondaryColor,
              tooltip: 'GitHub',
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.article), // Placeholder for a Blog/Medium
              onPressed: () => _launchURL('https://medium.com/@your-username'),
              iconSize: 30,
              color: kTextSecondaryColor,
              tooltip: 'Blog',
            ),
          ],
        ),
        const SizedBox(height: 40),
        const Divider(color: Colors.white24),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            "© 2025 Supragya Sharma. Built with Flutter & 💛",
            style: TextStyle(color: kTextSecondaryColor),
          ),
        ),
      ],
    );
  }
}