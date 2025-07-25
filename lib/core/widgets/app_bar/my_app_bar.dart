import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:short_url/core/constants/app_images.dart';
import 'package:short_url/core/constants/app_menu_list.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/constants/app_text_styles.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/navigation/route_name.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/app_bar/app_bar_drawer.dart';
import 'package:short_url/core/widgets/app_bar/drawer_menu.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: SizedBox(
        height: context.width * 0.1,
        width: context.width,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSizes.gap(w: context.width * 0.02),
            InkWell(
              onTap: () {
                if (GoRouter.of(context).state.name == RouteName.home) {
                  return;
                }
                GoRouter.of(context).goNamed(RouteName.home);
              },
              child: AppLogo(),
            ),
            Expanded(child: context.isDesktop ? LargeMenu() : AppBarDrawer(),),
            AppSizes.gap(w: context.width * 0.02),
          ],
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppImages.appLogo, width: context.width*0.03, height: context.width*0.03),
        Text(
          'ShortURL',
          style: context.theme.textTheme.headlineLarge!.copyWith(
            fontSize: context.isMobile?context.dynamicFont(0.03):context.dynamicFont(0.015),
          ),
        ),
      ],
    );
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: AppMenuList.getItems(context)
          .map(
            (AppMenu menu) => LargeAppBarMenuItem(
              text: menu.title,
              isSelected: true,
              onTap: () {
                switch (menu.routeName) {
                  case RouteName.home:
                    GoRouter.of(context).goNamed(RouteName.home);
                  case RouteName.pricing:
                    GoRouter.of(context).goNamed(RouteName.pricing);
                  case RouteName.docs:
                    GoRouter.of(context).goNamed(RouteName.docs);
                  case RouteName.aboutUs:
                    GoRouter.of(context).goNamed(RouteName.aboutUs);
                  case RouteName.contactUs:
                    GoRouter.of(context).goNamed(RouteName.contactUs);
                  case RouteName.termsConditions:
                    GoRouter.of(context).goNamed(RouteName.termsConditions);
                  default:
                    GoRouter.of(context).goNamed(RouteName.home);
                }
              },
            ),
          )
          .toList(),
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.textColor,
  });

  final String text;
  final Color? textColor;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(context.width*0.01),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: context.isMobile?context.dynamicFont(0.03):context.dynamicFont(0.01),
            color:
                textColor ??
                (GoRouter.of(context).state.name!
                            .replaceAll(RegExp("_"), "")
                            .trim()
                            .toLowerCase() ==
                        text.replaceAll(RegExp(" "), "").trim().toLowerCase()
                    ? AppColors.primaryColor
                    : AppColors.subTextColor),
          ),
        ),
      ),
    );
  }
}
