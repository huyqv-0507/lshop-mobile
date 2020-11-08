import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laptop_mobile/extensions/shared_preference_extension/shared_preference_extension.dart';

class FirebaseBloc {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final firebaseStorage = FirebaseStorage(
    app: FirebaseStorage.instance.app,
    storageBucket: "gs://laptopec-db3cb.appspot.com/",
  );

  //Google Login
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    sharedPreferenceExtension.setToken(googleAuth.idToken);
    // Once signed in, return the UserCredential
    return await firebaseAuth.signInWithCredential(credential);
  }

  //Phone
  /*Future<void> signInWithMobileNumber(
      String phoneNumber, BuildContext context) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('----${credential.smsCode}');
        await firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int resendToken) {
        TextEditingController verifyController = TextEditingController();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Enter your OTP:'),
                content: TextField(
                  controller: verifyController,
                  decoration: InputDecoration(
                    focusedBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                actions: [
                  FlatButton(
                      onPressed: () async {
                        final code = verifyController.text.trim();
                        PhoneAuthCredential phoneAuthCredential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId, smsCode: code);
                        await firebaseAuth
                            .signInWithCredential(phoneAuthCredential)
                            .then((value) => {
                                  Navigator.of(context).pop(),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NavigationUI()))
                                })
                            .catchError((onError) {
                          if (onError.code == 'invalid-verification-code') {
                            print('Invalid OTP');
                          }
                          print(
                              'FirebaseBloc - signInWithMobileNumber - $onError');
                        });
                      },
                      child: Center(
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: kThemePrimaryColor),
                        ),
                      ))
                ],
              );
            });
      },
      timeout: const Duration(seconds: 15),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }*/
/*
//Facebook Login
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  //Twitter Login
  Future<UserCredential> signInWithTwitter() async {
    return null;
  }

  //Sign out account
  Future<void> signOut() async {
    sharedPrefs.logOut();
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }

  void getNotification() {
    firebaseMessaging.configure(
      onBackgroundMessage: myBackgroundMessageHandler,
      onMessage: (Map<String, dynamic> message) async {},
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
    // Or do other work.
  }*/
}

final FirebaseBloc firebaseBloc = FirebaseBloc();
