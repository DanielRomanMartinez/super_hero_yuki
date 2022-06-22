import 'package:flutter/material.dart';

class CommonTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool enableLeadingOption;
  final String title;

  const CommonTopAppBar({
    required this.title,
    this.enableLeadingOption = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      leading: (enableLeadingOption)
          ? InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.chevron_left,
                size: 26,
                color: Color(0xffe04815),
              ),
            )
          : const SizedBox.shrink(),
      centerTitle: true,
      shape:
          const Border(bottom: BorderSide(color: Color(0xffe04815), width: 1)),
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
