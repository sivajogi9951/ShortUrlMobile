import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/qr_code/presentation/pages/qr_code.dart';
import 'package:short_url/features/shorten_url/presentation/pages/short_url.dart';
import 'package:short_url/features/campaign/presentation/pages/utm_builder.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSizes.edgeAll(context.width*0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: AppColors.whiteColor,
      ),
      constraints: BoxConstraints(
        maxWidth: context.width*0.9,
        minWidth: context.width*0.6,
        maxHeight: _currentTab==1?context.width * 0.6:context.width * 0.2,
      ),
      child: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              isScrollable: true,
              onTap: (val) {
                setState(() {
                  _currentTab = val;
                });
              },
              labelStyle: context.theme.textTheme.bodyLarge!.copyWith(
                fontSize: context.setFontSize(16),
                fontWeight: FontWeight.bold
              ),
              labelPadding: EdgeInsets.only(
                right: context.setFontSize(15),
                top: context.setFontSize(4),
              ),
              indicatorWeight: 2,
              indicatorPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(text: 'Short URL'),
                Tab(text: 'UTM Builder'),
                Tab(text: 'QR Code'),
              ],
            ),
            Expanded(
              child: Padding(
                padding: AppSizes.edgeAll(context.width*0.01),
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [ShortUrlTab(), UtmBuilder(), QrCodeTab()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
