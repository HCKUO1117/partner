import 'package:flutter/material.dart';
import 'package:partner/models/person_model.dart';

import '../utils/utils.dart';
import 'custom_action_chip.dart';

class PersonCard extends StatelessWidget {
  final PersonModel model;

  const PersonCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        return Container(
          padding: const EdgeInsets.all(4),
          child: Theme(
            data: ThemeData(),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      model.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        model.intro,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        for (int j = 0;
                            j <
                                (width > 200
                                    ? Utils.listLengthCounter(
                                        listLength: model.tags.length,
                                        maxLength: 3,
                                      )
                                    : width > 160
                                        ? Utils.listLengthCounter(
                                            listLength: model.tags.length,
                                            maxLength: 2,
                                          )
                                        : Utils.listLengthCounter(
                                            listLength: model.tags.length,
                                            maxLength: 1,
                                          ));
                            j++)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CustomActionChip(
                                onTap: () {},
                                label: model.tags[j].name,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
