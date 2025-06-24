import 'package:flutter/material.dart';
import 'package:portfolio_website/components/section_title.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/theme.dart';



class ProjectsSection extends StatelessWidget {
  final bool isMobile;
  const ProjectsSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    // --- UPDATED PROJECT DATA with 'detailedDescription' ---
    final projects = [
      {
        'title': 'Cloud-Native E-Commerce Platform',
        'description': 'A microservices-based e-commerce website deployed on AWS.',
        'detailedDescription': 'Built with a microservices architecture on AWS EKS (Kubernetes). Features separate services for products, orders, and user authentication. A full CI/CD pipeline using GitHub Actions automates deployment.',
        'tech': ['AWS', 'Kubernetes', 'Docker', 'Node.js', 'React'],
        'link': 'https://github.com/your-username/your-repo',
      },
      {
        'title': 'Serverless Data Processing Pipeline',
        'description': 'An automated, event-driven pipeline on AWS Lambda.',
        'detailedDescription': 'This cost-efficient, fully serverless pipeline triggers on S3 image uploads. An AWS Lambda function processes the image, extracts EXIF metadata, and stores the results in a DynamoDB table for querying.',
        'tech': ['AWS Lambda', 'S3', 'DynamoDB', 'Python'],
        'link': 'https://github.com/your-username/your-repo',
      },
      {
        'title': 'This Portfolio Website',
        'description': 'A responsive portfolio built with Flutter for Web.',
        'detailedDescription': 'This website itself is a project! It is built with Flutter for Web, ensuring a smooth, app-like experience. It is deployed as a static site on AWS S3 and delivered globally via CloudFront CDN for optimal performance.',
        'tech': ['Flutter', 'Dart', 'AWS S3', 'CloudFront'],
        'link': 'https://github.com/your-username/your-repo',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Featured Projects'),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: projects
                    .map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: ProjectCard(project: p),
                        ))
                    .toList(),
              )
            : Wrap(
                spacing: 24,
                runSpacing: 24,
                children: projects.map((p) => ProjectCard(project: p)).toList(),
              )
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const ProjectCard({super.key, required this.project});

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
    final isMobile = MediaQuery.of(context).size.width < 950;
    
    // On mobile, we don't need the hover effect, so we create a simpler card.
    if (isMobile) {
      return _buildMobileCard();
    }

    // Desktop card with hover effect
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(widget.project['link']),
        child: SizedBox(
          width: 350,
          height: 350,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // The base card, always visible
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 350,
                height: 350,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white10, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.project['title'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project['description'],
                      style: const TextStyle(
                        color: kTextSecondaryColor,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (widget.project['tech'] as List<String>)
                          .map((tech) => Chip(
                                label: Text(tech),
                                backgroundColor: kPrimaryColor,
                                labelStyle: const TextStyle(color: kTextSecondaryColor, fontSize: 12),
                                side: const BorderSide(color: Color(0xFF333333)),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              // The hover overlay card
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _isHovered ? 1.0 : 0.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: _isHovered
                        ? (Matrix4.identity()..scale(1.05))
                        : Matrix4.identity(),
                    transformAlignment: Alignment.center,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          kAccentColor.withOpacity(0.95),
                          const Color(0xFFcfa500).withOpacity(0.95),
                        ]
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kAccentColor.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project['title'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Text(
                            widget.project['detailedDescription'],
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => _launchURL(widget.project['link']),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            foregroundColor: kAccentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          ),
                          child: const Text('View on GitHub'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A separate build method for the non-hoverable mobile card
  Widget _buildMobileCard() {
    return GestureDetector(
        onTap: () => _launchURL(widget.project['link']),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(8),
             border: Border.all(color: Colors.white10, width: 1),
          ),
          child: Column(
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
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: (widget.project['tech'] as List<String>)
                    .map((tech) => Chip(
                          label: Text(tech),
                          backgroundColor: kPrimaryColor,
                          labelStyle: const TextStyle(color: kTextSecondaryColor, fontSize: 12),
                          side: const BorderSide(color: Color(0xFF333333)),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      );
  }
}
