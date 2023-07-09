import 'package:e_commerce/common/widgets/AnimatedBarExample.dart';
import 'package:e_commerce/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

import 'features/home/screens/home_screens.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){

  switch(routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AuthScreen(),
      );
      case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomeScreen(),
      );
      case BubbelBarExample.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const BubbelBarExample(),
      );

     
  default:
    return MaterialPageRoute(
  builder: (_)=> const Scaffold(
  body: Center(
  child: Text('Screen does not exist'),
  ),
  )
  ,);

  }
}