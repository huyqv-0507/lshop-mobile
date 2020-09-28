import 'package:flutter/material.dart';
import 'package:laptop_mobile/extensions/handlers/color.dart';
import 'package:laptop_mobile/extensions/handlers/padding_size.dart';
import 'package:laptop_mobile/extensions/handlers/text_style_handler.dart';
import 'package:laptop_mobile/ui/screens/login_ui.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegistrationUI extends StatefulWidget {
  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          _bgImage(),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                icon: Icon(MdiIcons.arrowLeft),
                onPressed: () => Navigator.pop(context)),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kdefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _titleLogin(),
                      _verticalSpace(kSpace_16),
                      _loginForm(),
                      _verticalSpace(kSpace_16),
                      _signUpButton()
                    ],
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Already have an account?'),
                  FlatButton(
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginUI())),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            color: kPrimaryTextColor,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _bgImage() {
    return Opacity(
        opacity: 0.07,
        child: Image.asset(
          'assets/images/bg.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ));
  }

  Widget _titleLogin() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Create',
            style: TextStyleHandler.titleLoginTitle,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'your account',
            style: TextStyleHandler.titleLoginTitle,
          ),
        ),
      ],
    );
  }

  Widget _loginForm() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 3, offset: Offset(1, 1), color: Colors.grey)
          ]),
      child: Column(
        children: [
          _registrationTextField('Username', null, false),
          _registrationTextField('Your name', null, true),
          _registrationTextField('Email', null, true),
          _registrationTextField('Password', null, true),
          _registrationTextField('Confirm password', null, true),
          _verticalSpace(25)
        ],
      ),
    );
  }

  Widget _registrationTextField(
      String labelText, TextEditingController controller, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        cursorColor: kPrimaryLabelTextColor,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyleHandler.labelText,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryLabelTextColor))),
      ),
    );
  }

  //Login button
  Widget _signUpButton() {
    return FlatButton(
      height: 60,
      onPressed: null,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey,
                  offset: Offset(0, 13),
                  spreadRadius: -12)
            ]),
        child: Center(
          child: Text(
            'Sign up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _verticalSpace(double kdefaultSpace) {
    return SizedBox(
      height: kdefaultSpace,
    );
  }
}
