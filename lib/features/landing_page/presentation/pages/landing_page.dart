import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/widgets/app_bar/drawer_menu.dart';
import 'package:short_url/core/widgets/app_bar/my_app_bar.dart';

class LandingPage extends StatelessWidget {
  final Widget child;
  const LandingPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: MyAppBar()),
          context.isDesktop?SizedBox.shrink():DrawerMenu(),
          Expanded(flex: 14, child: child),
        ],
      ),
    );
  }
}
