import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paytrybe_assessment/app/shared/widgets/text/base_text.dart';

import '../../../../core/config/navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.onLeadingTapped,
    this.hasLeading = false,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onLeadingTapped;
  final bool hasLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: hasLeading
          ? leading
          : InkWell(
              onTap: () => pop(context),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: SvgPicture.asset(
                  'assets/svg//back_arrow.svg',
                  width: 15,
                  height: 15,
                ),
              ),
            ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: Row(
            children: [
              ...?actions,
            ],
          ),
        ),
      ],
      title: title != null
          ? BaseText(
              text: title!,
              weight: FontWeight.w600,
              size: 14,
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
