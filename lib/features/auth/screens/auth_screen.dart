import 'package:e_commerce/common/widgets/custom_button.dart';
import 'package:e_commerce/common/widgets/custom_textField.dart';
import 'package:e_commerce/services/auth_services.dart';
import 'package:flutter/material.dart';
enum Auth{
  sigin,
  signup
}
class AuthScreen extends StatefulWidget {

  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.sigin;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  
void signUpUser(){
  authServices.signUpUser(
    context: context,
    name: _nameController.text,
    email: _emailController.text,
    password: _passwordController.text
    );
}
void signInUser(){
  authServices.signInUser(
    context: context,
    email: _emailController.text,
    password: _passwordController.text
    );
}
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/images/welcome.png"),
              if(_auth==Auth.signup)
                Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                      hintText: "Full Name",
                        controller: _nameController,
                        icon: const Icon(Icons.face_3_outlined),
                      ),
                      const SizedBox(height: 10,),
                      CustomTextField(
                        hintText: "Email",
                        controller: _emailController,
                        icon: const Icon(Icons.email_outlined),
                      ),
                      const SizedBox(height: 10,),
                      CustomTextField(
                        hintText: "Password",
                        controller: _passwordController,
                        icon: const Icon(Icons.password),
                      ),
                      CustomButton(
                        text: "Register",
                        onTap: (){
                          if(_signUpFormKey.currentState!.validate()){
                            signUpUser();
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("New to Cart ? ",style: TextStyle(
                            fontWeight: FontWeight.w400,
                            decorationColor: Colors.black38,

                          ),),
                          TextButton(onPressed: (){
                            setState(() {
                              _auth = Auth.sigin;
                            });

                          }, child: const Text("LogIn"))
                        ],
                      ),
                    ],
                  ),
                ),
              if(_auth==Auth.sigin)
                Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: "Email",
                        controller: _emailController,
                        icon: const Icon(Icons.email_outlined),
                      ),
                      const SizedBox(height: 10,),
                      CustomTextField(
                        hintText: "Password",
                        controller: _passwordController,
                        icon: const Icon(Icons.password),
                      ),
                      CustomButton(
                        text: "LogIn",
                        onTap: (){
                          if(_signInFormKey.currentState!.validate()){
                            signInUser();
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("New to Cart ? ",style: TextStyle(
                            fontWeight: FontWeight.w400,
                            decorationColor: Colors.black38,

                          ),),
                          TextButton(onPressed: (){
                            setState(() {
                              _auth = Auth.signup;
                            });

                          }, child: const Text("Register"))
                        ],
                      )
                    ],
                  ),
                ),


            ],
          )
      ),
    );
  }
}
