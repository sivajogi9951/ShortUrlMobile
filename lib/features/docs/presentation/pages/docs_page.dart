import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/docs/presentation/widgets/faq.dart';
import 'package:short_url/features/docs/presentation/widgets/free_user.dart';
import 'package:short_url/features/docs/presentation/widgets/overview.dart';
import 'package:short_url/features/docs/presentation/widgets/paid_user.dart';

class DocsPage extends StatefulWidget {
  const DocsPage({super.key});

  @override
  State<DocsPage> createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
  int currentIndex = 1;
  List<String> titles = [
    "OVERVIEW",
    "FREE USER",
    "PAID USER",
    "FAQ's",
  ];
  List<Widget> screens = [
    Overview(),
    FreeUser(),
    PaidUser(),
    Faq(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: context.isMobile?4:1,
            child: ListView(
              children: List.generate(
                titles.length,
                (index) => Container(
                  color: currentIndex == index
                      ?AppColors.whiteColor:Colors.transparent,
                  child: ListTile(
                    title: Text(titles[index],style:context.theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: currentIndex == index
                          ?FontWeight.w600:FontWeight.w400,
                      fontSize: context.setFontSize(currentIndex == index
                          ?18:16)
                    ) ,),
                    subtitle: Divider(
                      height: 4,
                      color: currentIndex == index
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: context.isMobile?6:8, child: screens[currentIndex]),
        ],
      ),
    );
  }
}
