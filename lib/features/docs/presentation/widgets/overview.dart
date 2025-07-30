import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/docs/presentation/widgets/bullets_tile.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes.edgeVH(v: 12,h: 16),
      color: AppColors.whiteColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Overview',
                style: context.theme.textTheme.displayLarge!.copyWith(
                  fontSize: context.setFontSize(32),
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Simplify, Monitor, and Interact in One Place ',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'In today\'s fast-paced digital economy, efficiency is not an option. It\'s necessary. Whether you\'re distributing campaign links, analyzing consumer activity, or engaging people offline with QR codes, maintaining URLs has become a strategic role. That\'s where ShortURL by Signitives comes in.',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'ShortURL is not a normal link shortener. It\'s a complete tool that combines three key functions - Short URL, UTM builder, and QR Code Generator into a single, seamless experience. ShortURL was created by Signitives, a firm recognized for delivering precision-engineered SaaS solutions. It allows marketers, developers, and product teams to streamline, track, and grow their link-sharing strategy.',
              bullets: [],
            ),
            SizedBox(height: 10),
            Text(
              'What is ShortURL?',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'ShortURL is a service that helps users to convert large web URLs into short, manageable connections. These abbreviated URLs are simpler to share across digital platforms, take up less space in communications, and increase visual clarity in emails, social media, and printed materials.',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title: 'But we did not stop there.',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'While shortening URLs is the basis, we\'ve added further layers to make each link work harder for you. With built-in UTM tracking and QR code creation, ShortURL transforms from a utility to a growth tool. ',
              bullets: [],
            ),
            SizedBox(height: 10),
            Text(
              'Why Signitives Built ShortURL ',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'At Signitives, we do not believe in digital guessing. Every click counts, as does every touchpoint. We developed ShortURL to help organizations achieve clarity, agility, and control over how they distribute information, measure campaigns, and connect with audiences, both online and offline. ',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Our mission is to provide organizations with tools that provide demonstrable outcomes without excessive complexity. ',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'ShortURL represents that vision. It\'s quick. It\'s versatile. It\'s designed to grow alongside your business. ',
              bullets: [],
            ),
            SizedBox(height: 10),
            Text(
              'The Impact of ShortURL: Three Pillars in One ',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title: '1. Short URL: Cut the Confusion ',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Long URLs can disrupt the user experience. They appear sloppy, mislead consumers, and frequently fail on certain platforms. ShortURL resolves this issue fast.',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title: 'Our link shortening service allows you to: ',
              bullets: [
                'Convert lengthy links into tidy, compact URLs.',
                'Customize your links with customized slugs to increase awareness.',
                'Reduce broken links in messages, emails, and documents. ',
                'Assess click-through performance over time. ',
              ],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Short links boost delivery, accessibility, and user trust, regardless of whether they are used for marketing, internal operations, or product demos. ',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title: '2. UTM Builder: Measure What is Essential',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Tracking digital marketing is crucial for understanding what works. The UTM Builder in ShortURL makes it simple to add campaign parameters to your URLs and measure user interaction with accuracy.',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title: 'Here is what you can do.',
              bullets: [
                'Create UTM tags with ease; no manual formatting is necessary.',
                'Standardize tracking between platforms and teams.',
                'Determine source, medium, campaign, and content performance.',
                'Export or reuse templates for recurrent campaigns. ',
              ],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'ShortURL shifts analytics from reactionary reporting to strategic insights. When you add structured UTM parameters, each click becomes part of a data-rich tale that you can act on.',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  '3. QR Code Generator: Combine the Physical and Digital Worlds',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'QR codes are once again used as an effective engagement tool, particularly in real-world settings, product packaging, and print media. ShortURL allows you to quickly produce scannable, high-resolution QR codes that are directly linked to your shortened links.',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title: 'Using our QR code generator, you can:',
              bullets: [
                'Create branded QR codes connected to any URL.',
                'Download in several formats for online and print.',
                'Track scans and engagements as you do with link clicks.',
                'Combine QR codes and UTM links for complete offline marketing tracking.',
              ],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Whether it\'s a retail poster, a café menu, or an event flyer, ShortURL makes it easy for people to scan and act, all while you gather real-time data.',
              bullets: [],
            ),
            SizedBox(height: 10),
            Text(
              'Created for Teams, A Pathway for Growth',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'ShortURL isn\'t only for advertisers. It\'s intended for anybody who appreciates clarity and efficiency, including product managers, content strategists, data analysts, and operations leaders.',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Signitives has ensured that ShortURL adapts to a variety of use cases: ',
              bullets: [
                'Marketing Campaigns: Accurately track success across paid, social, and email channels.',
                'Product Releases: Share documentation or software versions without using long, cumbersome URLs.',
                'Sales enablement: Include concise links to pitches and follow-ups.',
                'Customer Support: Provide information or troubleshooting pages that are free of technical clutter.',
                'Events & Offline Campaigns: Use QR codes to smoothly move from offline to online. ',
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Why ShortURL Matters ',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'We recognize there are different URL shortening options available. How does ShortURL differ from other URLs?',
              bullets: [
                'By Signitives: Developed by a team with extensive experience in product engineering and SaaS innovation.'
                    'All-In-One Interface: There\'s no need to switch between several programs for shortening, tagging, and creating QR codes.',
                'Privacy & Control: Your links and data will be safeguarded and maintained securely.',
                'Built to Scale: Whether you\'re creating 10 or 10,000 links, ShortURL remains fast and dependable.',
                'Professional, Modern UI: A straightforward design guarantees that everyone on your team can utilize it with ease.',
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Get Started Right Away',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title: 'Using ShortURL is exceptionally easy: ',
              bullets: [
                'Enter your lengthy URL in the input box.',
                'Customize the slug, include UTM values, or create a QR code.',
                'Click Create.  ',
                'Copy and share. Done. ',
              ],
            ),
            BulletsTile(
              title:
                  'There is no difficult onboarding. No coding is required. Only speedier workflows and smarter connectivity. ',
              bullets: [],
            ),
            SizedBox(height: 10),
            Text(
              'The Future of Link Management, Now',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(padding: EdgeInsets.zero,title: 'ShortURL is not a standalone gimmick. It is a strategic enabler.', bullets: []),
            BulletsTile(padding: EdgeInsets.zero,title: 'As organizations adopt increasingly customized, measurable, and multichannel interaction models, the demand for clean, traceable, and multipurpose connections will only increase. ShortURL is ready to help you shorten URLs today while providing insights for tomorrow.', bullets: []),
            BulletsTile(padding: EdgeInsets.zero,title: 'With Signitives behind it, you can expect constant improvements, enterprise-ready support, and a roadmap tailored to your specific requirements. ', bullets: []),
            BulletsTile(padding: EdgeInsets.zero,title: 'ShortURL by Signitives is more than just a link generator. It serves as a platform for more effective communication and decision-making.', bullets: []),
            BulletsTile(padding: EdgeInsets.zero,title: 'Whether you\'re tweeting, analyzing a campaign, or embedding a QR code in a brochure, make every interaction count.  ', bullets: []),
            BulletsTile(padding: EdgeInsets.zero,title: 'Shorten the length. Keep the influence in mind. Thrive with ShortURL.', bullets: []),
            BulletsTile(padding: EdgeInsets.zero,title: 'Need help? Contact our support team at support@shorturl.com', bullets: []),
          ],
        ),
      ),
    );
  }
}
