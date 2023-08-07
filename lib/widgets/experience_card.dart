import 'package:flutter/material.dart';
import 'package:partner/constants.dart';

class ExperienceCard extends StatelessWidget {
  final String content;
  final Function()? onEdit;
  final Function()? onDelete;

  const ExperienceCard({
    Key? key,
    required this.content,
    required this.onEdit,
    required this.onDelete,
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
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 18),
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
        ));
  }
}
