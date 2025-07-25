import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:short_url/core/constants/app_menu_list.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/navigation/route_name.dart';
import 'package:short_url/core/widgets/app_bar/my_app_bar.dart';
part 'drawer_menu.g.dart';

@riverpod
class DrawerMenuController extends _$DrawerMenuController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  open() {
    update((state) => true);
  }

  close() {
    update((state) => false);
  }
}

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 200),
    vsync: this,
  );
  late final _animation = Tween<Offset>(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  @override
  Widget build(BuildContext context) {
    ref.listen(drawerMenuControllerProvider, (prev, next) {
      if (next.value == true) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    return Visibility(
      visible: ref.watch(drawerMenuControllerProvider).value == true,
      child: ClipRRect(
        child: SlideTransition(
          position: _animation,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: context.theme.colorScheme.surface.withValues(
                    alpha: 0.4,
                  ),
                  blurRadius: 6,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: SmallMenu(
              onTap: () {
                ref.read(drawerMenuControllerProvider.notifier).close();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SmallMenu extends StatelessWidget {
  final VoidCallback onTap;
  const SmallMenu({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onTap();
              },
            ),
          )
          .toList(),
    );
  }
}
