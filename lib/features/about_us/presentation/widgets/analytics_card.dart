import 'package:flutter/material.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/about_us/data/model/analytics_model.dart';

class AnalyticsCard extends StatelessWidget {
  final AnalyticsModel data;

  const AnalyticsCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.setFontSize(8),vertical: context.setFontSize(4)),
        width: context.width*0.23,
        height: context.width*0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryAccentColor,
                  borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.all(context.setFontSize(20)),
              child: Icon(data.icon,size: context.setFontSize(60),color: AppColors.whiteColor,),
            ),
            Text(data.title,),
            Text(data.subTitle,),

          ],
        ),
      ),
    );
  }
}
