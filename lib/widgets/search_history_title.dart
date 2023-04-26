import 'package:flutter/material.dart';

class SearchHistoryTitle extends StatelessWidget {
  final Function() onTap;
  final String value;

  const SearchHistoryTitle({
    Key? key,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const Icon(
              Icons.history,
              color: Colors.grey,
            ),
            const SizedBox(width: 16),
            Text(
              value,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
