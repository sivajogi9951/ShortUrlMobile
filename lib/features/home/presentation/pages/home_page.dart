import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/features/home/presentation/pages/home_desktop.dart';
import 'package:short_url/features/home/presentation/pages/home_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isMobile ? HomeMobile() : HomeDesktop();
  }
}
