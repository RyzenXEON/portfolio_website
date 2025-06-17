// --- PARTICLE ANIMATION WIDGET ---
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio_website/theme.dart';

import 'package:simple_animations/simple_animations.dart';

class Particle {
  final Color color;
  double x, y, speed, angle, size;

  Particle({
    required this.color,
    required this.x,
    required this.y,
    required this.speed,
    required this.angle,
    required this.size,
  });
}

class ParticleAnimationWidget extends StatefulWidget {
  const ParticleAnimationWidget({super.key});

  @override
  _ParticleAnimationWidgetState createState() =>
      _ParticleAnimationWidgetState();
}

class _ParticleAnimationWidgetState extends State<ParticleAnimationWidget> {
  final Random _random = Random();
  final List<Particle> _particles = [];
  late Size _size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _size = Size(
      MediaQuery.of(context).size.width / 3, // Approximate width
      400, // Fixed height
    );
    if (_particles.isEmpty) {
      _initializeParticles();
    }
  }

  void _initializeParticles() {
    for (int i = 0; i < 50; i++) {
      // Number of particles
      _particles.add(
        Particle(
          color: kAccentColor.withOpacity(_random.nextDouble() * 0.8 + 0.2),
          x: _random.nextDouble() * _size.width,
          y: _random.nextDouble() * _size.height,
          speed: _random.nextDouble() * 0.5 + 0.2,
          angle: _random.nextDouble() * 2 * pi,
          size: _random.nextDouble() * 2 + 1,
        ),
      );
    }
  }

  void _updateParticles() {
    for (var p in _particles) {
      p.x += cos(p.angle) * p.speed;
      p.y += sin(p.angle) * p.speed;

      // Wrap particles around the screen
      if (p.x < 0) p.x = _size.width;
      if (p.x > _size.width) p.x = 0;
      if (p.y < 0) p.y = _size.height;
      if (p.y > _size.height) p.y = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoopAnimationBuilder<int>(
      duration: const Duration(milliseconds: 1000),
      tween: ConstantTween(1),
      builder: (context, value, child) {
        _updateParticles();
        return CustomPaint(
          size: Size.infinite,
          painter: ParticlePainter(_particles),
        );
      },
    );
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var p in particles) {
      paint.color = p.color;
      canvas.drawCircle(Offset(p.x, p.y), p.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}