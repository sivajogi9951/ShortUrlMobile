import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/widgets/app_bar/drawer_menu.dart';

class AppBarDrawer extends ConsumerStatefulWidget {
  const AppBarDrawer({super.key});

  @override
  ConsumerState<AppBarDrawer> createState() => _AppBarDrawerState();
}

class _AppBarDrawerState extends ConsumerState<AppBarDrawer>
    with SingleTickerProviderStateMixin {
  bool isOpen = true;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(drawerMenuControllerProvider, (prev, next) {
      if (next.value == true) {
        controller.forward();
        setState(() {
          isOpen = false;
        });
      } else {
        controller.reverse();
        setState(() {
          isOpen = true;
        });
      }
    });
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () {
          setState(() {
            if (isOpen) {
              controller.forward();
              ref.read(drawerMenuControllerProvider.notifier).open();
            } else {
              controller.reverse();
              ref.read(drawerMenuControllerProvider.notifier).close();
            }
            isOpen = !isOpen;
          });
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: animation,
          size: context.width * 0.03,
        ),
      ),
    );
  }
}
