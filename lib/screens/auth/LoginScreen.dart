import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Widgets/TextWidget.dart';

import '../../Widgets/AuthButton.dart';
import '../../Widgets/GoogleButton.dart';
import '../../consts/consts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passFocusNode.dispose();
    _passTextController.dispose();
    super.dispose();
  }

  void _submitLoginForm() {
    final _isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_isValid) {
      print('form is valid');
    } else {
      print('form is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            itemCount: Consts.authImagesPath.length,
            duration: 800,
            autoplayDelay: 1000,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(Consts.authImagesPath[index],
                  fit: BoxFit.cover);
            },
            autoplay: true,
          ),
          Container(color: Colors.black.withOpacity(0.7)),
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                TextWidget(
                    text: 'Welcome Back',
                    fontSize: 30,
                    color: Colors.white,
                    isTitle: true),
                const SizedBox(
                  height: 8,
                ),
                TextWidget(
                  text: 'Sign in to continue',
                  fontSize: 22,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(_passFocusNode),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email adress';
                          } else {
                            return null;
                          }
                        },
                        controller: _emailTextController,
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        focusNode: _passFocusNode,
                        obscureText: _obscureText,
                        onEditingComplete: () {
                          _submitLoginForm();
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Please enter a valid password';
                          } else {
                            return null;
                          }
                        },
                        controller: _passTextController,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text('Forget Password',
                            style: TextStyle(
                                color: Colors.lightBlue,
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                fontStyle: FontStyle.italic)))),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: AuthButton(fct: () {}, ButtonText: 'Login'),
                ),
                const SizedBox(
                  height: 8,
                ),
                const GoogleButton(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        )),
                    const SizedBox(width: 5),
                    TextWidget(
                      text: 'OR',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    const Expanded(
                        flex: 2,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        ))
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: AuthButton(
                      ButtonText: 'Continue as a guest',
                      fct: () {},
                      primary: Colors.black),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                      text: 'Don\'t have an accout ?',
                      style: TextStyle(fontSize: 18),
                      children: [
                        TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.lightBlue,
                                decoration: TextDecoration.underline))
                      ]),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
