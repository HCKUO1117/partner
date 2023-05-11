import 'package:flutter/material.dart';
import 'package:partner/constants.dart';

class MenuListButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final IconData? icon;
  final bool highlight;

  const MenuListButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.icon,
    this.highlight = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(height: double.maxFinite,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {},
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        if(highlight)
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Container(
          color: Constants.primaryYellow,
          width: 50,
          height: 2,
        ),)
      ],
    );
  }
}
