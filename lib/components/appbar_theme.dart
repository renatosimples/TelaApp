import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final VoidCallback? onHelpPressed;
  final VoidCallback? onMenuPressed;

  const CustomAppBar({
    super.key,
    required this.userName,
    this.onHelpPressed,
    this.onMenuPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarColor =
        theme.appBarTheme.backgroundColor ?? const Color(0xFF808080);
    final foregroundColor = theme.appBarTheme.foregroundColor ?? Colors.red;

    return SizedBox(
      height: preferredSize.height,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: AppBar(
              backgroundColor: appBarColor,
              foregroundColor: foregroundColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              titleSpacing: 16,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 20, color: appBarColor),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Olá, $userName',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: foregroundColor,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.help_outline, color: foregroundColor),
                  onPressed: onHelpPressed ?? () {},
                ),
                IconButton(
                  icon: Icon(Icons.format_list_bulleted, color: foregroundColor),
                  onPressed: onMenuPressed ?? () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Container(
              width: double.infinity,
              color: appBarColor,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 6,
                    ),
                    elevation: 2,
                    minimumSize: const Size(100, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Cometa', style: TextStyle(fontSize: 14)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
