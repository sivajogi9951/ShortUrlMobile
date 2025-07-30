import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/features/docs/presentation/widgets/bullets_tile.dart';

class MyExpansionTile extends StatelessWidget {
  final String title;
  final List<BulletsTile> sections;
  const MyExpansionTile({super.key, required this.title, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(dividerColor: Colors.transparent),
      child: Container(
        margin: AppSizes.edgeVH(v: 4),
        decoration: BoxDecoration(
          color: context.theme.canvasColor,
          borderRadius: BorderRadius.circular(14)
        ),
        child: ExpansionTile(
          expandedAlignment: Alignment.centerLeft,
          title: title.trim().isNotEmpty?Text(title,style: context.theme.textTheme.headlineLarge!.copyWith(fontSize: context.setFontSize(18)),):SizedBox.shrink(),
          children: List.generate(sections.length, (index)=>BulletsTile(title: sections[index].title, bullets: sections[index].bullets)),
          // children: <Widget>[
          //   BulletsTile(
          //     title: subTitle,
          //     bullets: bullets,
          //   ),
          // ],
        ),
      ),
    );
  }
}
