import 'package:flutter/material.dart';

class EyeVisibility extends StatelessWidget {
  const EyeVisibility({
    Key? key,
    required this.show,
  }) : super(key: key);

  final ValueNotifier<bool> show;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        show.value = !show.value;
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Icon(
          show.value
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: Theme.of(context).canvasColor,
          size: 18,
        ),
      ),
    );
  }
}
