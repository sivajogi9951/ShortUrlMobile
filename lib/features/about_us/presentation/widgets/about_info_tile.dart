// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';

enum AboutInfoType { titleDesc, titleBullets, titleSubDesc }

class AboutInfoTile extends StatelessWidget {
  final String title;
  final String desc;
  final List<String> bullets;
  final AboutInfoType type;
  const AboutInfoTile({
    super.key,
    required this.title,
    this.desc = '',
    this.bullets = const [],
    this.type = AboutInfoType.titleDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.theme.textTheme.titleLarge!.copyWith(
      fontSize: context.setFontSize(22),
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor
      ),
          ),
          Padding(padding: EdgeInsets.all(16), child: _getData(type,context)),
        ],
      ),
    );
  }

  _getData(AboutInfoType type,BuildContext context) {
    switch (type) {
      case AboutInfoType.titleDesc:
        return Text(desc,style: context.theme.textTheme.bodyLarge!.copyWith(
          fontSize: context.setFontSize(16)
        ),);
      case AboutInfoType.titleBullets:
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bullets.isNotEmpty
                ? List.generate(
                    bullets.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('• ${bullets[index]}',style: context.theme.textTheme.bodyLarge!.copyWith(
                          fontSize: context.setFontSize(16)
                      ),),
                    ),
                  )
                : [],
          ),
        );
      case AboutInfoType.titleSubDesc:
        return _getFormattedBullets(context,bullets);
    }
  }

  _getFormattedBullets(BuildContext context, List<String> bullets) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: bullets.isNotEmpty
            ? List.generate(bullets.length, (index) {
                String text = bullets[index];
                List<String> substrings = text.split(":");
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,size: 8,color: AppColors.primaryColor,),
                      Expanded(child: RichText(
                        text: TextSpan(
                          text: ' ${substrings[0]} :',
                          style: context.theme.textTheme.titleSmall!.copyWith(
                              fontSize: context.setFontSize(16),
                              color: AppColors.primaryAccentColor,
                            fontWeight: FontWeight.w600
                          ),
                          children: [
                            TextSpan(
                              text: substrings[1],
                              style: context.theme.textTheme.titleSmall!.copyWith(
                                  fontSize: context.setFontSize(14),
                                  color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),),
                    ],
                  ),
                );
              })
            : [],
      ),
    );
  }
}
