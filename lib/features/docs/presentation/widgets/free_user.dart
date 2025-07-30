import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/docs/presentation/widgets/bullets_tile.dart';

class FreeUser extends StatelessWidget {
  const FreeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes.edgeVH(v: 12, h: 16),
      color: AppColors.whiteColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Free User',
                style: context.theme.textTheme.displayLarge!.copyWith(
                  fontSize: context.setFontSize(32),
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Whether you\'re a business founder, freelancing marketer, student, or someone searching for a dependable way to organize and distribute links, ShortURL by Signitives provides a fully free experience to get you started. This site will walk you through the process of creating an account, shortening URLs, creating QR codes, and measuring your performance - all for free. \n\nIt is not necessary to be a developer. There is no need to make any changes. All that\'s required is a browser, a few minutes, and the URL you wish to shorten. ',
              textAlign: TextAlign.start,
              style: context.theme.textTheme.bodyLarge!.copyWith(
                color: AppColors.blackColor,
                fontSize: context.setFontSize(16),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'What ShortURL offers for a Free User ',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'ShortURL provides a feature-rich experience for its free users. While sophisticated functionality is intended for premium tiers, the free version nevertheless allows you to: ',
              bullets: [
                'Shorten lengthy URLs instantly.',
                'Create customized aliases for your URLs.',
                'Create UTM-tagged URLs for campaign tracking.',
                'Generate high-quality QR codes',
                'View the basic click analytics and scan statistics.',
                'Monitor your connections using an easy-to-use interface.',
              ],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Now, let us go over the entire process, from register to link management',
              bullets: [],
            ),

            SizedBox(height: 10),
            Text(
              'Step 1: Create A Free Account ',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'To use the app and save your activities, you have to create a free account. ',
              bullets: [
                'Click on https://url.signitivessoft.com.',
                'Click the "Sign Up" link in the upper right corner.',
                'Please provide your name, email address, and password.',
                'Acknowledge the Terms of Service and Privacy Policy.',
                'To complete the account creation process, click "Register." ',
              ],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'After you\'ve registered, you\'ll be directed to your User Dashboard, which is your personal workspace for all your shortened URLs, QR codes, and UTM links.',
              bullets: [],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'If you have already registered with ShortURL, you can just simply click on Login and enter your credentials.',
              bullets: [],
            ),
            SizedBox(height: 10),
            Text(
              'Step 2: Shorten a URL',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Once you\'ve logged in, the main feature you\'ll see is the URL shortener.',
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title: 'Here’s how to use it:',
              bullets: [
                'Find the input box labelled "Enter your long URL". ',
                'Paste the whole URL that you wish to abbreviate.',
                'Optional: You can change the short URL slug.  ',
                'Click "Shorten". ',
              ],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Your new short link will show below the input box, along with choices for:',
              bullets: [
                'Copy the URL into your clipboard.',
                'Create a QR code swiftly.  ',
                'View link metrics. ',
              ],
            ),
            Text(
              'This link may now be shared by email, social media, text messaging, or print. ',
            ),
            SizedBox(height: 10),
            Text(
              'Step 3: Add UTM Parameters',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'The UTM Builder lets you analyze how your links fare across many platforms.',
              bullets: [
                'On the dashboard, navigate to the "UTM Builder" tab.',
                'Enter your base URL (the link you wish to promote).  ',
                'Fill in the appropriate areas. ',
                'Click “Generate UTM URL”. ',
              ],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'ShortURL will automatically add the arguments and show the entire UTM link. You can now shorten it with the help of the same shortener tool, keeping it clean and preserving all the given tracking abilities. ',
              bullets: [],
            ),
            SizedBox(height: 10),
            Text(
              'Step 4: Generate a QR Code ',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Willing to convert your shortened URL into a scannable QR code? You can accomplish this immediately:',
              bullets: [
                'Once you\'ve shortened the URL, select the "QR Code" option next to the URL. ',
                'ShortURL will produce a QR code that corresponds to the precise URL.',
                'Click "Download" to save the QR code as an image. ',
              ],
            ),
            BulletsTile(
              padding: EdgeInsets.zero,
              title: 'This is perfect for: ',
              bullets: [
                'Posters/Flyers ',
                'Brochures ',
                'Product labels ',
                'Event signage ',
                'Business cards ',
              ],
            ),
            Text(
              'Users may now scan and visit your link directly, with no typing or mistakes. ',
            ),
            SizedBox(height: 10),
            Text(
              'Step 5: Track QR Code Scans',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              title:
                  'In the same Dashboard, ShortURL displays basic scan data for each QR code.',
              bullets: [],
              padding: EdgeInsets.zero,
            ),
            BulletsTile(
              title:
                  'While free users have restricted stats, you will still be able to: ',
              bullets: [
                'View all the scans. ',
                'Identify the highest-performing links',
                'Measure the initial engagement.',
              ],
              padding: EdgeInsets.zero,
            ),
            SizedBox(height: 10),
            Text(
              'Usage Tips for Free Users ',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'Even if you\'re using the free version, you may still make use of the platform: ',
              bullets: [
                'Use meaningful aliases: This increases click-through rates and provides context.',
                'Shorten the UTM links: It keeps your URLs neat while providing performance data.',
                'Download and test QR codes: Print and scan them yourself to ensure correctness.  ',
                'Check your dashboard weekly: Examine link statistics and eliminate unnecessary links. ',
              ],
            ),

            BulletsTile(
              padding: EdgeInsets.zero,
              title:
                  'As business demands expand, you\'ll be ready to scale up, but even at the free level, you can create smart, trackable campaigns. ',
              bullets: [],
            ),
            SizedBox(height: 10),
            Text(
              'Use Cases for Free Users ',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(
              title:
                  'Here are some common instances of how free users might profit. ',
              bullets: [
                'Students share academic materials, project links, and surveys.',
                'Small company administrators promote their items using fliers or WhatsApp.',
                'Event planners share RSVP connections with QR codes',
                'Content creators connect to YouTube, blogs, or portfolios.',
                'Social media managers measure interaction through bio links.',
              ],
              padding: EdgeInsets.zero,
            ),
            BulletsTile(
              title:
                  'Whatever your purpose, ShortURL makes sharing and monitoring easier and more efficient - all for free.',
              bullets: [],
              padding: EdgeInsets.zero,
            ),
            BulletsTile(
              title:
                  'While the free version is solid, we are working diligently on features such as: ',
              bullets: [
                'Improved analytics with location and device data',
                'Collaboration among the team members',
                'Branded domain support.',
                'Link Expiration and Access Control  ',
                'Exportable reports ',
              ],
              padding: EdgeInsets.zero,
            ),
            BulletsTile(
              title:
                  'When you\'re all set, upgrading will provide you access to even more features; nevertheless, for the time being, the free tier is a solid starting point. ',
              bullets: [],
              padding: EdgeInsets.zero,
            ),
            SizedBox(height: 10),
            Text(
              'Ready to Try It?',
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            BulletsTile(title: 'There is no struggle, no obligation. Just click on https://url.signitivessoft.com, make an account, and start shortening.', bullets: [],padding: EdgeInsets.zero,),
            BulletsTile(title: 'ShortURL by Signitives is intended to develop alongside you. Begin as a free user. Develop into a data-savvy campaigner. Expand into power users at your own pace.', bullets: [],padding: EdgeInsets.zero,),

          ],
        ),
      ),
    );
  }
}
