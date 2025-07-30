import 'package:flutter/material.dart';
import 'package:short_url/core/constants/app_images.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/text_fields/app_text_fields.dart';
import 'package:short_url/features/contact_us/presentation/widgets/contact_us_header.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ContactUsHeader(),
            Expanded(child: context.isMobile ? Column() : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: context.height,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset(AppImages.contactUs,height: context.height*0.6,),),
                        Expanded(child: Container(
                          margin: EdgeInsets.only(right: 30),
                          padding: EdgeInsets.symmetric(vertical:25,horizontal: 30),
                          height: context.height*0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.whiteColor
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Send us a message',style: context.theme.textTheme.headlineSmall!.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: context.setFontSize(22)
                              ),),
                              SizedBox(height: 20,),
                              AppTextFields(hintText: 'Your Name'),
                              SizedBox(height: 10,),
                              AppTextFields(hintText: 'Your Email'),
                              SizedBox(height: 10,),
                              AppTextFields(hintText: 'Message',maxLines: 4,),
                              SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(onPressed: (){}, child: Text('Submit')),
                              )

                            ],
                          ),
                        ),),
                      ],
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
