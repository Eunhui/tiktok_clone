import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/src/fa_icon.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon? icon;
  final bool? isBlack;

  const AuthButton(
      {super.key, required this.text, this.icon, this.isBlack = false});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      //widget what has size. relative of size of father
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14,
          horizontal: Sizes.size14,
        ),
        decoration: BoxDecoration(
            color: isBlack! ? Colors.black87 : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isBlack! ? Colors.white : Colors.grey.shade200,
              width: Sizes.size2,
            )),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: icon),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: isBlack! ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
