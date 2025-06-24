import 'package:flutter/material.dart';
import 'package:portfolio_website/components/section_title.dart';
import 'package:portfolio_website/theme.dart';


// --- MODIFIED: SKILLS SECTION ---
class SkillsSection extends StatelessWidget {
  final bool isMobile;
  const SkillsSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    final skillsData = [
      {
        'icon': Icons.cloud_queue_rounded,
        'category': 'Cloud Platforms',
        'skills': ['AWS', 'Google Cloud (GCP)', 'Microsoft Azure'],
      },
      {
        'icon': Icons.all_inclusive_rounded,
        'category': 'DevOps & Containers',
        'skills': ['Docker', 'Kubernetes', 'CI/CD', 'Terraform'],
      },
      {
        'icon': Icons.code_rounded,
        'category': 'Programming',
        'skills': ['Dart', 'Python', 'Java', 'JavaScript'],
      },
      {
        'icon': Icons.layers_rounded,
        'category': 'Frameworks',
        'skills': ['Flutter', 'Node.js', 'Flask'],
      },
      {
        'icon': Icons.storage_rounded,
        'category': 'Databases',
        'skills': ['MySQL', 'PostgreSQL', 'MongoDB', 'Firebase'],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'My Skills'), // Assuming SectionTitle is in its own file
        const SizedBox(height: 40),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: skillsData.map((skillItem) {
            return SkillCard(
              icon: skillItem['icon'] as IconData,
              category: skillItem['category'] as String,
              skills: skillItem['skills'] as List<String>,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SkillCard extends StatefulWidget {
  final IconData icon;
  final String category;
  final List<String> skills;

  const SkillCard({
    super.key,
    required this.icon,
    required this.category,
    required this.skills,
  });

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 950;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        // Enforce a fixed size for symmetry
        width: isMobile ? double.infinity : 250,
        height: 320,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          // Add a subtle gradient
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1E1E1E),
              _isHovered ? const Color(0xFF2a2a2a) : const Color(0xFF1E1E1E),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered ? kAccentColor : Colors.white10,
            width: 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: kAccentColor.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Use MainAxisAlignment.spaceBetween to push content apart
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top part of the card
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(widget.icon, color: kAccentColor, size: 44),
                const SizedBox(height: 20),
                Text(
                  widget.category,
                  style: const TextStyle(
                    color: kTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Bottom part of the card
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.skills.map((skill) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '• $skill',
                  style: const TextStyle(
                    color: kTextSecondaryColor,
                    fontSize: 16,
                    height: 1.3,
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
