// Project: Supragya Sharma | Portfolio

import 'package:flutter/material.dart';
import 'package:portfolio_website/components/mobile.dart';
import 'package:portfolio_website/theme.dart';
import 'components/desktop.dart';



void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supragya Sharma | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: kDarkTheme,
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: PortfolioMobileView(),
        desktopBody: PortfolioDesktopView(),
      ),
    );
  }
}

// --- RESPONSIVE LAYOUT WIDGET ---
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1200) {
          // Adjusted breakpoint for 2-column layout
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}


