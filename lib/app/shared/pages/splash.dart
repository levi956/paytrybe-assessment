import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paytrybe_assessment/app/modules/authentication/pages/mobile/input_mobile.dart';
import 'package:paytrybe_assessment/core/theme/bar_color.dart';

import '../../../core/config/navigation.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Widget page = const InputMobilePage();

        pushTo(context, page);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/svg/Logo.svg',
        ),
      ),
    );
  }
}
