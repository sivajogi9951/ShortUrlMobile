import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/features/about_us/data/model/analytics_model.dart';
import 'package:short_url/features/about_us/presentation/widgets/about_info_tile.dart';
import 'package:short_url/features/about_us/presentation/widgets/about_us_header.dart';
import 'package:short_url/features/about_us/presentation/widgets/analytics_card.dart';

class AboutUsMobile extends StatelessWidget {
  const AboutUsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AboutUsHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
              analyticsDummyData.length,
              (index) => AnalyticsCard(data: analyticsDummyData[index]),
            ),
          ),
        ),
        AboutInfoTile(
          title: 'Our Story',
          type: AboutInfoType.titleDesc,
          desc:
              'Founded by a passionate team of developers and marketers, ShortLink was created to solve the everyday challenges of sharing and tracking links online.',
        ),
        AboutInfoTile(
          title: 'Our Vision',
          type: AboutInfoType.titleDesc,
          desc:
              'To be the most trusted and innovative link management platform, enabling seamless digital experiences for everyone, everywhere.',
        ),
        AboutInfoTile(
          title: 'Our Values',
          type: AboutInfoType.titleBullets,
          bullets: [
            'Reliability and Security',
            'User-Centric Design',
            'Continuous Innovation',
            'Transparency and Trust',
          ],
        ),
        AboutInfoTile(
          title: 'Our Values',
          type: AboutInfoType.titleSubDesc,
          bullets: [
            'Shorten URLs Instantly: Transform long links into short, shareable URLs.',
            'Advanced Analytics: Track clicks, locations, devices, referrers, and more.',
            'QR Code Generation: Instantly create QR codes for every short link.',
            'UTM Builder: Add and manage UTM parameters for campaign tracking.',
            'Custom Domains: Use your own branded domain for short links.',
            'Link Management: Organize, edit, and manage all your links in one dashboard.',
            'Security & Privacy: HTTPS, password protection, and privacy-first design.',
            'API Access: Integrate with your own apps and workflows.',
            'Team Collaboration: Invite team members and manage permissions.',
          ],
        ),
      ],
    );
  }
}
