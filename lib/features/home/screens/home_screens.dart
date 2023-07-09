import 'package:e_commerce/features/home/widgets/address_box.dart';
import 'package:e_commerce/features/home/widgets/carousel_image.dart';
import 'package:e_commerce/features/home/widgets/deal_of_the_day.dart';
import 'package:e_commerce/features/home/widgets/top_categories.dart';
import 'package:e_commerce/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
   return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  padding: EdgeInsets.all(2),
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(17),
                    elevation: 1, child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () {},
                        child: const Padding(padding: EdgeInsets.only(left: 6
                        ),child: Icon(Icons.search,color: Colors.black,size: 23,),
                        ),
                        
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                      )
                    ),
                  
                  ),
                
                  ),
                ),
                
              ),
              Container(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.mic
                    ),),
                  ],
                )
              )
              
            ],
          ),
        
        ),
        ),
        body:  Column(
          children: const[
           AdderessBox(),
           SizedBox(height: 10,),
           TopCategories(),
           SizedBox(height: 10,),
           CarouselImage(),
           SizedBox(height: 10,),
           DealOfDay()
        ]),
    );
  }
}