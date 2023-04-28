import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:partner/constants.dart';
import 'package:partner/models/case_model.dart';

class CaseCard extends StatelessWidget {
  final CaseModel model;

  const CaseCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      constraints: const BoxConstraints(maxWidth: 300),
      height: 350,
      child: Theme(
        data: ThemeData(),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        model.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Text(
                    model.content,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
                Wrap(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    for (var element in model.tags)
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: ActionChip(
                          onPressed: () {},
                          label: Text(element.name),
                          backgroundColor: Constants.primaryYellowBackground,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Constants.primaryYellow),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        DateFormat('yyyy-MM-dd kk:mm').format(model.createdTime),
                        textAlign: TextAlign.end,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
