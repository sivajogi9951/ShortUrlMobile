import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/docs/presentation/widgets/bullets_tile.dart';
import 'package:short_url/features/docs/presentation/widgets/my_expansion_tile.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: AppSizes.edgeVH(v: 16, h: 24),
      child: Column(
        children: [
          Text(
            'FREQUENTLY ASKED QUESTIONS (FAQs)',
            style: context.theme.textTheme.displayLarge!.copyWith(
              fontSize: context.setFontSize(32),
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          AppSizes.gap(h: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Welcome to the Signitives’ ShortURL FAQ page. Regardless of whether you are a first-time user looking at our platform or an experienced marketer looking to expand your link management efforts, this page answers the most Frequently Asked Questions about how ShortURL works, what is included in our plans, and how to get the most out of your membership. ',
                    textAlign: TextAlign.start,
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      color: AppColors.blackColor,
                      fontSize: context.setFontSize(16),
                    ),
                  ),
                  MyExpansionTile(
                    title: '1. How do I generate a short URL? ',
                    sections: [
                      BulletsTile(
                        title: 'To generate a shortened URL: ',
                        bullets: [
                          'Sign into your ShortURL account.',
                          'Enter your lengthy link into the dashboard\'s input area.  ',
                          'Modify the alias as desired',
                          'Select "Shorten" to quickly generate your short URL.',
                          'Your new link will display in your dashboard, available for copying and sharing. ',
                        ],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '2. How many URLs can I generate? ',
                    sections: [
                      BulletsTile(
                        title: 'That depends on your plan: ',
                        bullets: [
                          'Free users can only create a restricted number of links per month (suited for personal or low-volume use).',
                          'Pro users may produce up to 10,000 links each month, including 5,000 short URLs as well as UTM links, and QR codes.',
                          'Enterprise users may produce an infinite number of URLs and QR codes, with no monthly restriction. ',
                        ],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '3. How do I track a shortened URL?',
                    sections: [
                      BulletsTile(
                        title:
                            'ShortURL automatically tracks each link you make. To view tracking information: ',
                        bullets: [
                          'Navigate to your My URLs dashboard.',
                          'Pick the link you wish to track. ',
                          'Select the "Analytics" icon adjacent to the link. ',
                        ],
                      ),
                      BulletsTile(
                        title: 'You’ll come across data such as:',
                        bullets: [
                          'The total number of clicks',
                          'Date and Time of Clicks  ',
                          'Simple location info.',
                          'Device and platform (paid plans)',
                        ],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title:
                        '4. What’s the difference between the Pro and Enterprise plans?',
                    sections: [
                      BulletsTile(
                        title: 'Pro Plan: ',
                        bullets: [
                          '10000 links, including 5,000 monthly short links, as well as UTM and QR codes.',
                          'Optimized for campaign-level analytics.',
                          'Suitable for startups, digital marketers, and smaller groups. ',
                        ],
                      ),
                      BulletsTile(
                        title: 'Enterprise Plan: ',
                        bullets: [
                          'Limitless link generation.',
                          'Comprehensive Analytics and Reports',
                          'Multi-user access and group cooperation',
                          'Domain branding alongside integration assistance',
                          'SLA-based support and customized initial integration. ',
                        ],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '5. Why should I upgrade to the Paid Version?',
                    sections: [
                      BulletsTile(
                        title:
                            'While the free version is ideal for personal or occasional usage, the paid versions enable professional-grade capabilities, such as:',
                        bullets: [
                          'Increased or unrestricted link volume.',
                          'Extensive tracking and analytics.',
                          'QR Code oversight  ',
                          'Data security and privacy measures.',
                          'Collaborative team features (Enterprise only) ',
                        ],
                      ),
                      BulletsTile(
                        title:
                            'If you manage campaigns, engage clients on a large scale, or want responsibility in reporting, the subscription plans provide tools to help you. ',
                        bullets: [],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '6.Can I customize the short URL slug?',
                    sections: [
                      BulletsTile(
                        title:
                            'Yes. Before selecting the "Shorten" option, you can customize your URL by adding a custom slug.',
                        bullets: [],
                      ),
                      BulletsTile(
                        title:
                            'This feature is critical for increasing brand visibility and making your connection more credible. ',
                        bullets: [],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '7. Can I create QR codes for my links? ',
                    sections: [
                      BulletsTile(
                        title:
                            'Certainly. Each short link you create has the option to produce a QR code. ',
                        bullets: [
                          'Select the "QR Code" button beside the link.',
                          'You may download the graphics in PNG, JPG, or SVG format.  ',
                          'Employ it for printing, packaging, or any offline promotion. ',
                        ],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '8. Are the links I created secure? ',
                    sections: [
                      BulletsTile(
                        title:
                            'Absolutely! ShortURL creates encrypted URLs that are hosted on safe, HTTPS-enabled servers.',
                        bullets: [],
                      ),
                      BulletsTile(
                        title:
                            'Furthermore, for Pro and Enterprise users, we provide enhanced monitoring security and use records to ensure traceability and adherence. ',
                        bullets: [],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '9. How does the UTM Builder work?',
                    sections: [
                      BulletsTile(
                        title:
                            'The UTM Builder enables you to include tracking parameters in your URLs to improve campaign identification. Here\'s how: ',
                        bullets: [
                          'Proceed to the UTM Builder tab.',
                          'Insert your base URL and fill out the sections for source, medium, and campaign name.  ',
                          'Create the complete UTM URL and shorten it instantly. ',
                        ],
                      ),
                      BulletsTile(
                        title:
                            'Just like technologies like Google Analytics, you can now properly trace your traffic origins. ',
                        bullets: [],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '10. Can I view QR code scan data?',
                    sections: [
                      BulletsTile(
                        title:
                            'Yes. For every QR code that you generate, you are now able to track: ',
                        bullets: [
                          'Number of scans',
                          'Time of scan',
                          'Platform used to scan ',
                        ],
                      ),
                      BulletsTile(
                        title:
                            'This is particularly beneficial in event promotions, physical ads, and product packaging applications. ',
                        bullets: [],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '11. Can I manage all my links in one place?',
                    sections: [
                      BulletsTile(
                        title:
                            'Absolutely. Every user has access to a customizable dashboard that allows them to:',
                        bullets: [
                          'Check all active links.',
                          'Modify or remove URLs.',
                          'Monitor results.',
                          'Obtain the accompanying QR codes.',
                          'Refine links by type (Short, UTM, QR).',
                        ],
                      ),
                      BulletsTile(
                        title:
                            'Enterprise users can additionally use sophisticated filtering and tagging options. ',
                        bullets: [],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title:
                        '12. How do I access billing and subscription details?',
                    sections: [
                      BulletsTile(
                        title: '',
                        bullets: [
                          'Log into your account.',
                          'Go to the "Account Settings" or "Billing" tab.',
                          'There, you will discover your membership type, renewal date, and payment choices.',
                        ],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '13. What happens if I exceed my Pro plan limit? ',
                    sections: [
                      BulletsTile(
                        title:
                            'If you reach the 5,000-link limit under the Pro plan, we will alert you via email and dashboard alerts. ',
                        bullets: [],
                      ),
                      BulletsTile(
                        title: 'You can either: ',
                        bullets: [
                          'Hold off for the upcoming reset period.  ',
                          'Subscribe to the Enterprise Plan for Unlimited Access. ',
                        ],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '14. Can I use ShortURL for team collaboration? ',
                    sections: [
                      BulletsTile(
                        title:
                            'Team collaboration is accessible with the Enterprise Plan.',
                        bullets: [],
                      ),
                      BulletsTile(
                        title: 'You will be able to:',
                        bullets: [
                          'Add several users to your account.',
                          'Establish roles and permissions.',
                          'Share dashboards and connect analytics locally.  ',
                          'Coordinate campaign-specific link monitoring. ',
                        ],
                      ),
                      BulletsTile(
                        title:
                            'This makes it excellent for agencies, departments, and cross-functional groups. ',
                        bullets: [],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: '15. How do I contact support? ',
                    sections: [
                      BulletsTile(
                        title:
                            'Free users can utilize the in-app help area or email assistance. Pro users receive priority email assistance.',
                        bullets: [],
                      ),
                      BulletsTile(
                        title:
                            'Enterprise users enjoy SLA-based assistance and have access to a specialized account manager.',
                        bullets: [],
                      ),
                      BulletsTile(
                        title:
                            'For urgent difficulties, go to your Dashboard and select the "Support" option. ',
                        bullets: [],
                      ),
                    ],
                  ),
                  MyExpansionTile(
                    title: 'Still have questions? ',
                    sections: [
                      BulletsTile(
                        title:
                            'If your question isn\'t answered here, we can assist. Contact our support staff through the Help Center or send us a query via your dashboard.',
                        bullets: [],
                      ),
                      BulletsTile(
                        title:
                            'ShortURL by Signitives simplifies, tracks, and secures every link you publish, providing clarity and trust. ',
                        bullets: [],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
