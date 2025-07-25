import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Roboto Text Styles',
          style: textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('displayLarge', style: textTheme.displayLarge),
              gap(),
              Text('displayMedium', style: textTheme.displayMedium),
              gap(),
              Text('displaySmall', style: textTheme.displaySmall),
              gap(),
              Text('headlineLarge', style: textTheme.headlineLarge),
              gap(),
              Text('headlineMedium', style: textTheme.headlineMedium),
              gap(),
              Text('headlineSmall', style: textTheme.headlineSmall),
              gap(),
              Text('titleLarge', style: textTheme.titleLarge),
              gap(),
              Text('titleMedium', style: textTheme.titleMedium),
              gap(),
              Text('titleSmall', style: textTheme.titleSmall),
              gap(),
              Text('bodyLarge', style: textTheme.bodyLarge),
              gap(),
              Text('bodyMedium', style: textTheme.bodyMedium),
              gap(),
              Text('bodySmall', style: textTheme.bodySmall),
              gap(),
              Text('labelLarge', style: textTheme.labelLarge),
              gap(),
              Text('labelMedium', style: textTheme.labelMedium),
              gap(),
              Text('labelSmall', style: textTheme.labelSmall),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox gap() => SizedBox(height: 16);
}