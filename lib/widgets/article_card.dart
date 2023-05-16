import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:partner/constants.dart';
import 'package:partner/models/article_model.dart';

import 'custom_action_chip.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel model;

  const ArticleCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      constraints: const BoxConstraints(maxWidth: 300),
      height: 380,
      child: Theme(
        data: ThemeData(),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            model.image,
                            height: 200,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              colors: [Colors.black54, Colors.transparent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    model.creatorImage,
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(child: Text(model.creatorName)),
                                const SizedBox(width: 4),
                                Text(
                                  DateFormat('yyyy-MM-dd').format(model.createdTime),
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              model.title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Spacer(),
                            Wrap(
                              clipBehavior: Clip.antiAlias,
                              children: [
                                for (var element in model.tags)
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: CustomActionChip(
                                      onTap: () {},
                                      label: element.name,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.thumb_up,
                                  size: 14,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  model.good.toString(),
                                  style: const TextStyle(color: Colors.black54),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.visibility,
                                  size: 14,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  model.viewed.toString(),
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    model.isCollected ? Icons.bookmark : Icons.bookmark_border,
                    color: model.isCollected ? Constants.primaryOrange : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
