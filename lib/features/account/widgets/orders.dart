import 'package:e_commerce/constants/global_variables.dart';
import 'package:e_commerce/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    "assets/images/welcome.png",
    "assets/images/welcome.png",
    "assets/images/welcome.png",
    "assets/images/welcome.png",
    "assets/images/welcome.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text('Your Orders' , style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Text('See all' , style: TextStyle(
                color: GlobalVariables.selectedNavBarColor,
              ),),
            )
          ],
        )
        ,Container(
          height: 170,
          padding: EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: ((context,index){
              return SingleProduct(images: list[index]);
            
          })),
        )
      ]
      
    );
  }
}