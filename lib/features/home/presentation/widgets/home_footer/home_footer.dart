import 'package:flutter/material.dart';
import 'package:short_url/features/home/presentation/widgets/home_footer/sections/contact_info.dart';
import 'package:short_url/features/home/presentation/widgets/home_footer/sections/quick_links.dart';
import 'package:short_url/features/home/presentation/widgets/home_footer/sections/social_section.dart';
import 'package:short_url/features/home/presentation/widgets/home_footer/sections/trademark_info.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: SocialSection(),),
            Expanded(child: QuickLinks(),),
            Expanded(child: ContactInfo(),),
          ],
        ),
        TrademarkInfo(),
      ],
    );
  }
}
