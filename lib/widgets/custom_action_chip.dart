import 'package:flutter/material.dart';
import 'package:partner/constants.dart';

class CustomActionChip extends StatelessWidget {
  final String label;
  final Function() onTap;
  final bool choose;
  final bool category;

  const CustomActionChip({
    Key? key,
    required this.label,
    required this.onTap,
    this.choose = false,
    this.category = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onTap,
      label: Text(label,style: TextStyle(fontSize: category ? 18: null,color: choose ? Colors.white:Constants.primaryOrange),),
      padding: category ? const EdgeInsets.all(8) : null,
      backgroundColor: choose ? Constants.primaryOrange : Constants.primaryYellowBackground,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Constants.primaryOrange),
        borderRadius:category ?  BorderRadius.circular(5): BorderRadius.circular(20),
      ),
    );
  }
}
