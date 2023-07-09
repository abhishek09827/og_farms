import 'package:e_commerce/common/widgets/AnimatedBarExample.dart';
import 'package:e_commerce/constants/global_variables.dart';
import 'package:e_commerce/provider/user_provider.dart';
import 'package:e_commerce/router.dart';
import 'package:e_commerce/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/admin/screens/admin_screen.dart';
import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider())
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authServices = AuthServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authServices.getUserData(context); 
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmKart',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,

        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
      ?Provider.of<UserProvider>(context).user.type=='user'
        ?const BubbelBarExample()
        :const AdminScreen()
      :const AuthScreen()
    );
    }
}
