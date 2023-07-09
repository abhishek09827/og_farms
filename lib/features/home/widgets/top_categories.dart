import 'package:e_commerce/constants/global_variables.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: 75,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context,index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(GlobalVariables?.categoryImages[index]['images']?? "assets/images/welcome.png",
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,

                  ),
                ),
              ),
              Text(
                GlobalVariables?.categoryImages[index]['title']?? "Farm",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          );
        }
      ),
    );
  }
}