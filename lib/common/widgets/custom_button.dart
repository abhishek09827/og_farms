import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({Key? key,required this.text
  ,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(

          onPressed: onTap,
        style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)

        ),
          minimumSize: const Size(double.infinity, 50)
        ),
          child: Text(text),
      ),
    );
  }
}
