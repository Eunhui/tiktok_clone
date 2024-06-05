import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
  });
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size32, vertical: Sizes.size10),
            decoration: BoxDecoration(
              color: disabled ? Colors.black54 : Colors.black,
              borderRadius: BorderRadius.circular((Sizes.size32)),
            ),
            child: const Text('Next',
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
