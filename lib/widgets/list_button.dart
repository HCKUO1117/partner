import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final IconData? icon;
  final String title;
  final VoidCallback onTap;
  final bool? selected;

  const ListButton({
    Key? key,
    this.icon,
    required this.title,
    required this.onTap,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: selected ?? false ? Colors.black12 : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon),
            const SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 18
              ),
            )
          ],
        ),
      ),
    );
  }
}
