import 'package:flutter/material.dart';
import 'package:partner/models/person_model.dart';

import '../constants.dart';

class PersonCard extends StatelessWidget {
  final PersonModel model;

  const PersonCard({
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
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
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
                const SizedBox(height: 16),
                Text(
                  model.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Text(
                    model.intro,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
