import 'package:flutter/material.dart';
import 'package:laptop_mobile/blocs/user_bloc/authentication_bloc/authentication_bloc.dart';
import 'package:laptop_mobile/blocs/user_bloc/firebase_bloc/firebase_bloc.dart';
import 'package:laptop_mobile/extensions/handlers/color.dart';
import 'package:laptop_mobile/extensions/handlers/padding_size.dart';
import 'package:laptop_mobile/extensions/handlers/text_style_handler.dart';
import 'package:laptop_mobile/ui/screens/registration_ui.dart';
import 'package:laptop_mobile/models/views/login_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'navigation_ui.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  signInWithGoogle() {
    firebaseBloc
        .signInWithGoogle()
        .then((value) => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationUI()))
            })
        .catchError((onError) =>
            {print('LoginScreen - signInWithGoogle ------------- $onError')});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleLogin(),
                _verticalSpace(kSpace_16),
                _loginForm(),
                _verticalSpace(kSpace_16),
                _signInButton(),
                _signUpButton(),
                _labelSignUp(),
                _socialLoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleLogin() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Sign in',
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
          color: kFormColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 3, offset: Offset(1, 1), color: kBoxShadowFormColor)
          ]),
      child: Column(
        children: [
          _loginTextField('Username', usernameController, false),
          _loginTextField('Password', passwordController, true),
          _errorSignIn(),
          _verticalSpace(25)
        ],
      ),
    );
  }

  Widget _loginTextField(
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

  ///region SIGN IN WITH ACCOUNT
  _signInWithAccount(loginModel) async {
    await authenticationBloc.signUpWithAccount(loginModel);
    authenticationBloc.isSigned
        ? Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NavigationUI()))
        : Container();
  }

  Widget _errorSignIn() {
    return StreamBuilder<bool>(
        initialData: false,
        stream: authenticationBloc.authStream,
        builder: (context, snapshot) {
          return snapshot.hasError
              ? Padding(
                  padding: const EdgeInsets.only(left: kdefaultPadding),
                  child: Column(
                    children: [
                      _verticalSpace(10),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${snapshot.error}',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                )
              : Container();
        });
  }

  //Login button
  Widget _signInButton() {
    return FlatButton(
      height: 60,
      onPressed: () => _signInWithAccount(
        LoginModel(usernameController.text, passwordController.text),
      ),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: kPrimaryButtonColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 10,
                  color: kBoxShadowFormColor,
                  offset: Offset(0, 13),
                  spreadRadius: -12)
            ]),
        child: Center(
          child: Text(
            'Sign in',
            style: TextStyle(
                color: kSecondaryTextColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  ///endregion

  ///region SIGN UP WITH ACCOUNT
  //Register button
  Widget _signUpButton() {
    return FlatButton(
      height: 60,
      onPressed: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegistrationUI()))
      },
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: kSecondaryButtonColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 10,
                  color: kBoxShadowFormColor,
                  offset: Offset(0, 13),
                  spreadRadius: -12)
            ]),
        child: Center(
          child: Text(
            'Sign up',
            style: TextStyle(
                color: kPrimaryTextColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  //Text label
  Widget _labelSignUp() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kSpace_16),
        child: Text('Or sign in with social account'),
      ),
    );
  }

  ///endregion
  //Row contains two button social login
  Widget _socialLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: _loginWithMobileNumberButton()),
        Expanded(child: _loginWithGoogleButton()),
        Expanded(child: _loginWithFacebookButton())
      ],
    );
  }

  //Google login button
  Widget _loginWithMobileNumberButton() {
    return FlatButton(
      height: 60,
      onPressed: null,
      child: Container(
          width: 150,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kBgMobileNumberColor,
          ),
          child: Icon(
            MdiIcons.phone,
            size: 24,
            color: kMobileNumberColor,
          )),
    );
  }

  //Google login button
  Widget _loginWithGoogleButton() {
    return FlatButton(
      height: 60,
      onPressed: () => signInWithGoogle(),
      child: Container(
          width: 150,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kBgGoogleColor,
          ),
          child: Icon(
            MdiIcons.google,
            size: 24,
            color: kGoogleColor,
          )),
    );
  }

  //Facebook login button
  Widget _loginWithFacebookButton() {
    return FlatButton(
      height: 60,
      onPressed: null,
      child: Container(
          width: 150,
          height: 45,
          decoration: BoxDecoration(
            color: kBgFacebookColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            MdiIcons.facebook,
            size: 24,
            color: kFacebookColor,
          )),
    );
  }

  //Custom space
  Widget _verticalSpace(double kdefaultSpace) {
    return SizedBox(
      height: kdefaultSpace,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
