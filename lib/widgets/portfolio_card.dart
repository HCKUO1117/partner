import 'package:flutter/material.dart';
import 'package:partner/constants.dart';
import 'package:partner/widgets/image_widget.dart';

class PortfolioCard extends StatelessWidget {
  final String name;
  final String content;
  final List<String> images;
  final String link;
  final Function()? onEdit;
  final Function()? onDelete;

  const PortfolioCard({
    Key? key,
    required this.content,
    required this.onEdit,
    required this.onDelete,
    required this.name,
    required this.images,
    required this.link,
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
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var element in images)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ImageWidget(
                              url: element,
                              width: 50,
                              height: 50,
                            ),
                          ),
                      ],
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
