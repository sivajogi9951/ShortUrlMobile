import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/buttons/app_button.dart';
import 'package:short_url/core/widgets/text_fields/app_text_fields.dart';
import 'package:short_url/features/shorten_url/presentation/provider/short_url_provider.dart';

class ShortUrlTab extends ConsumerStatefulWidget {
  const ShortUrlTab({super.key});

  @override
  ConsumerState<ShortUrlTab> createState() => _ShortUrlTabState();
}

class _ShortUrlTabState extends ConsumerState<ShortUrlTab> {
  String output = '';
  final mainUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    void requestShortUrl() async {
      final result = await ref
          .read(shortUrlProvider.notifier)
          .requestShortUrl(
        mainURL: mainUrlController.text.trim(),
        deviceId: 'rk_laptop',
      );

      result.fold(
              (failure) => setState(() => output = failure.message),
              (shortURL) => setState(() => output = shortURL.shortUrl!),);
          }
    return Form(
        key: _formKey,
        child: ListView(
      padding: context.isMobile
          ? AppSizes.edgeAll(context.width * 0.03)
          : AppSizes.edgeAll(context.width * 0.005),
      children: [
        Text(
          'Shorten URL',
          style: context.theme.textTheme.headlineSmall!.copyWith(
            fontSize: context.setFontSize(18),
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        AppSizes.gap(
          h: context.isMobile ? context.width * 0.03 : context.width * 0.005,
        ),
        AppTextFields(
          controller: mainUrlController,
          hintText: 'Enter URL',
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Enter URL';
            }
            return null;
          },
        ),
        AppSizes.gap(
          h: context.isMobile ? context.width * 0.03 : context.width * 0.005,
        ),
        output.isNotEmpty?Row(
          children: [
            Expanded(child: Text(output)),
            IconButton(onPressed: ()async{
              await Clipboard.setData(ClipboardData(text: output));
            }, icon: Icon(Icons.copy))
          ],
        ):SizedBox.shrink(),
        AppSizes.gap(
          h: context.isMobile ? context.width * 0.03 : context.width * 0.005,
        ),
        AppButton(label: 'Shorten URL', onPressed: (){
          if (_formKey.currentState!.validate()) {
            requestShortUrl();
          }
        }),
      ],
    ));
  }

  @override
  void dispose() {
    mainUrlController.dispose();
    super.dispose();
  }
}
