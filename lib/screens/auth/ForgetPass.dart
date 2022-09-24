import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../Widgets/AuthButton.dart';
import '../../Widgets/TextWidget.dart';
import '../../consts/consts.dart';
import '../../widgets/BackWidget.dart';

class ForgetPass extends StatefulWidget {
  static const routeName = '/ForgetPass';
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _emailTextEditingController = TextEditingController();
  void _forgetPassFCT(){

  }
  @override
  void dispose(){
    _emailTextEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            itemCount: Consts.authImagesPath.length,
            autoplay: true,
            autoplayDelay: 8000,
            duration: 800,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(Consts.authImagesPath[index],fit: BoxFit.cover);
            },
          ),
          Container(
            color : Colors.black.withOpacity(0.7)
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppBar().preferredSize.height,
                    child: BackWidget(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  TextWidget(
                    text: 'Forget Password',
                    color: Colors.white,
                    fontSize: 30,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextEditingController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        } else {
                          return null;
                        }
                      },
                      onEditingComplete: _forgetPassFCT,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white)),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        hintText: 'Email address',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: AuthButton(buttonText: 'Reset now', fct: (){},),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
