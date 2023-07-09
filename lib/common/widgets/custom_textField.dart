import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  const CustomTextField({Key? key,required this.controller, required this.hintText,required
  this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(

        decoration: InputDecoration(
          prefixIcon: icon,
          prefixStyle: const TextStyle(
              textBaseline: TextBaseline.ideographic
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
          hintStyle: const TextStyle(
            textBaseline: TextBaseline.ideographic
          ),

          border: InputBorder.none,


        ),
        controller: controller,
        validator: (value) {
          if(value!.isEmpty){
            return 'Enter your $hintText';
          }
          return null;
        },


      ),
    );
  }
}
