// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paytrybe_assessment/app/modules/home/pages/homepage.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';

import '../../../core/theme/bar_color.dart';

class DashboardPage extends StatefulHookConsumerWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.white);
    List<Widget> screens = const [
      HomePage(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
    ];
    final pageIndex = useState(0);
    const labelStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 12);
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: pageIndex.value,
            iconSize: 20,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: labelStyle,
            unselectedLabelStyle: labelStyle,
            onTap: (v) {
              pageIndex.value = v;
            },
            items: [
              BottomNavigationBarItem(
                icon: CustomIcon(
                  iconIndex: 0,
                  pageIndex: pageIndex,
                  path: 'home',
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  iconIndex: 1,
                  pageIndex: pageIndex,
                  path: 'transactions',
                ),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  iconIndex: 2,
                  pageIndex: pageIndex,
                  path: 'cards',
                ),
                label: 'Cards',
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  iconIndex: 3,
                  pageIndex: pageIndex,
                  path: 'settings',
                ),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: pageIndex.value,
        children: screens,
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final String path;
  const CustomIcon({
    Key? key,
    required this.pageIndex,
    required this.path,
    required this.iconIndex,
  }) : super(key: key);

  final ValueNotifier<int> pageIndex;
  final int iconIndex;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$path.svg',
      width: 21,
      height: 21,
      colorFilter: ColorFilter.mode(
        pageIndex.value == iconIndex ? const Color(0xFF007CFF) : AppColors.grey,
        BlendMode.srcIn,
      ),
    );
  }
}
