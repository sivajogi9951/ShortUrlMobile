import 'package:flutter/material.dart';

class BulletsTile extends StatelessWidget {
  final String title;
  final List<String> bullets;
  final EdgeInsets? padding;
  const BulletsTile({super.key, required this.title, required this.bullets, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding??const EdgeInsets.only(left: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: 8,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              bullets.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical:4.0),
                    child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                    SizedBox(width: 20,),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.brightness_1, size: 12),
                    ),
                    SizedBox(width: 12,),
                    Expanded(child: Text(bullets[index])),
                                    ],
                                  ),
                  ),
            ),
          ),
          SizedBox(height: 4,),
        ],
      ),
    );
  }
}
