import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/screens/auth/ForgetPass.dart';
import '../../Widgets/AuthButton.dart';
import '../../Widgets/BackWidget.dart';
import '../../Widgets/TextWidget.dart';
import '../../consts/consts.dart';
import '../../services/GlobalMethods.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  final _passTextEditingController = TextEditingController();
  final _shoppingAddressTextEditingController = TextEditingController();
  final _shoppingAddressFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passFocusNode = FocusNode();
  bool _obscureText = true;

  void _submitFormOnRegister() {
    var isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  void dispose() {
    _fullNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passTextEditingController.dispose();
    _shoppingAddressTextEditingController.dispose();
    _shoppingAddressFocusNode.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            itemCount: Consts.authImagesPath.length,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                Consts.authImagesPath[index],
                fit: BoxFit.cover,
              );
            },
            autoplay: true,
            autoplayDelay: 8000,
            duration: 800,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: AppBar().preferredSize.height,
                    child: BackWidget(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  TextWidget(
                    text: 'Welcome Back',
                    color: Colors.white,
                    fontSize: 30,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextWidget(
                    text: 'Sign in to continue',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          controller: _fullNameTextEditingController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field is missing';
                            } else {
                              return null;
                            }
                          },
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.white)),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            hintText: 'Full name',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailTextEditingController,
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocusNode,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email';
                            } else {
                              return null;
                            }
                          },
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.white)),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscureText,
                          focusNode: _passFocusNode,
                          controller: _passTextEditingController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_shoppingAddressFocusNode),
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
                                  color: Colors.white,
                                )),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.white)),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          controller: _shoppingAddressTextEditingController,
                          focusNode: _shoppingAddressFocusNode,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email';
                            } else {
                              return null;
                            }
                          },
                          onEditingComplete: _submitFormOnRegister,
                          decoration: const InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: 'Shopping address',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          GlobalMethods.navigateTo(context: context, routeName: ForgetPass.routeName);
                        },
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                          ),
                        )),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                      width: double.infinity,
                      child: AuthButton(
                          buttonText: 'Sign up',
                          fct: () {
                            _submitFormOnRegister();
                          })),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                        text: 'Already a user?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                              text: ' Sign in',
                              style: TextStyle(
                                  color: Colors.lightBlue, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.canPop(context)
                                      ? Navigator.pop(context)
                                      : null;
                                }),
                        ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
