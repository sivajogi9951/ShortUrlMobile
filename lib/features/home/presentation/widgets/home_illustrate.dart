import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_images.dart';
import 'package:short_url/core/extensions/extensions.dart';

class HomeIllustrate extends StatelessWidget {
  const HomeIllustrate({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.illustrator,width: context.width*0.5,height: context.height*0.5,);
  }
}
