import 'package:flutter/material.dart';
import 'package:partner/models/article_model.dart';
import 'package:partner/widgets/image_widget.dart';

class ArticleListTitle extends StatelessWidget {
  final ArticleModel model;
  final Function()? onEdit;
  final Function()? onDelete;

  const ArticleListTitle({
    Key? key,
    required this.model,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageWidget(
          url: model.image,
          width: 100,
          height: 100,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                model.title,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                model.content,
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
    );
  }
}
