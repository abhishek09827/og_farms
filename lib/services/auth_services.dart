import 'dart:convert';
import 'package:e_commerce/constants/error_handling.dart';
import 'package:e_commerce/constants/utils.dart';
import 'package:e_commerce/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/widgets/AnimatedBarExample.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import '../constants/global_variables.dart';
class AuthServices{
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password
  })async{
    try {
      User user = User(id: '', name: name, email: email, password: password, address: '', type: '', token: '');
      http.Response res = await http.post(Uri.parse('$uri/api/signup'), 
      body: user.toJson(),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8'
      }
      );
      // ignore: use_build_context_synchronously
      httpError(response: res, context: context, onSuccess: () {
        showSnackBar(context, 'Account Created! Login with the same credentials');

      });
    } catch (e) {
      showSnackBar(context, e.toString());
      
    }
  } 
  void signInUser({
    required BuildContext context,
    required String email,
    required String password
  })async{
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'), 
      body: jsonEncode({'email': email, 'password' : password}),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8'
      }
      );
      // ignore: use_build_context_synchronously
      httpError(response: res, context: context, onSuccess: () async{
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('x-auth-token', jsonDecode(res.body)['token']);
        Provider.of<UserProvider>(context,listen: false).setUser(res.body);
        Navigator.pushNamedAndRemoveUntil(context, BubbelBarExample.routeName, (route) => false);

      });
    } catch (e) {
      showSnackBar(context, e.toString()); 
      
    }
  }  
  void getUserData(
    BuildContext? context
  )async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if(token == null){
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('$uri/isTokenValid'),
        headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token!,
      }
      );
      var response = jsonDecode(tokenRes.body);
      if(response == true){
        http.Response userRes = await http.get(Uri.parse('$uri/'),
        headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token}
        );

      var userProvider = Provider.of<UserProvider>(context!,listen: false);
      userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context!, e.toString());
      
    }
  }
}