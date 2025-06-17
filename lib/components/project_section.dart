import 'package:flutter/material.dart';
import 'package:portfolio_website/components/section_title.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/theme.dart';



class ProjectsSection extends StatelessWidget {
  final bool isMobile;
  const ProjectsSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    // --- USER: ADD YOUR PROJECTS HERE ---
    final projects = [
      {
        'title': 'Cloud-Native E-Commerce Platform',
        'description':
            'A microservices-based e-commerce website deployed on AWS using EKS (Kubernetes), with services for products, orders, and users. Includes CI/CD pipeline with GitHub Actions.',
        'tech': ['AWS', 'Kubernetes', 'Docker', 'Node.js', 'React'],
        'link':
            'https://github.com/your-username/your-repo', // Replace with your link
      },
      {
        'title': 'Serverless Data Processing Pipeline',
        'description':
            'An automated pipeline using AWS Lambda and S3 events to process uploaded images, extract metadata, and store it in DynamoDB. Fully serverless and cost-efficient.',
        'tech': ['AWS Lambda', 'S3', 'DynamoDB', 'Python'],
        'link':
            'https://github.com/your-username/your-repo', // Replace with your link
      },
      {
        'title': 'This Portfolio Website',
        'description':
            'A responsive portfolio website built with Flutter for Web. Designed for performance and deployed as a static site on AWS S3 with CloudFront for global delivery.',
        'tech': ['Flutter', 'Dart', 'AWS S3', 'CloudFront'],
        'link':
            'https://github.com/your-username/your-repo', // Replace with your link
      },
    ];

    double desktopCardWidth = 350;
    if (!isMobile) {
      double screenWidth = MediaQuery.of(context).size.width;
      double availableWidth = screenWidth - (120 * 2) - (24 * 2);
      desktopCardWidth = availableWidth / 3;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Featured Projects'),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: projects
                    .map(
                      (p) => Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: ProjectCard(project: p),
                      ),
                    )
                    .toList(),
              )
            : Wrap(
                spacing: 24,
                runSpacing: 24,
                children: projects
                    .map(
                      (p) => ProjectCard(project: p, width: desktopCardWidth),
                    )
                    .toList(),
              ),
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final double? width;

  const ProjectCard({super.key, required this.project, this.width});

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      print('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _launchURL(widget.project['link']),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? kAccentColor : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: kAccentColor.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.project['description'],
                    style: const TextStyle(
                      color: kTextSecondaryColor,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: (widget.project['tech'] as List<String>)
                    .map(
                      (tech) => Chip(
                        label: Text(tech),
                        backgroundColor: kPrimaryColor,
                        labelStyle: const TextStyle(
                          color: kTextSecondaryColor,
                          fontSize: 12,
                        ),
                        side: const BorderSide(color: Color(0xFF333333)),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}