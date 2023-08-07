import 'package:flutter/material.dart';
import 'package:partner/constants.dart';

class ExpertiseCard extends StatelessWidget {
  final String name;
  final String content;
  final Function()? onEdit;
  final Function()? onDelete;

  const ExpertiseCard({
    Key? key,
    required this.content,
    required this.onEdit,
    required this.onDelete,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Constants.primaryOrangeBackground,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            if (onEdit != null)
              IconButton(
                onPressed: onEdit,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black54,
                ),
              ),
            if (onDelete != null)
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black54,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
