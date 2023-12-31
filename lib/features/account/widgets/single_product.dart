import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String images;
  const SingleProduct({super.key, required this.images});

  @override
  Widget build(BuildContext context) { 
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(border: Border.all(
          color: Colors.black26,
          width: 1.5
        ),
        borderRadius: BorderRadius.circular(5)
        ,color: Colors.white,),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: Image.network(images, fit: BoxFit.fitHeight,)
        ),
        ),
        
    );
  }
 
}