import 'package:flutter/material.dart';

class Custom_OutlineBotton extends StatelessWidget {
  final String BottomText;
  final void Function() onPressed;

  const Custom_OutlineBotton({
    Key? key,
    required this.BottomText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onPressed();
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        primary: Colors.black,
        backgroundColor: Colors.indigo.shade100,
        elevation: 4,
        side: const BorderSide(width: 3),
      ),
      child: Text(BottomText),
    );
  }
}
