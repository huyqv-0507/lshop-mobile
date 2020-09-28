import 'dart:async';
import 'package:laptop_mobile/repositories/user_repository.dart';
import 'package:laptop_mobile/models/views/login_model.dart';
import 'package:rxdart/subjects.dart';

class AuthenticationBloc {
  var authController = PublishSubject<bool>();
  Sink<bool> get authSink => authController.sink;
  Stream<bool> get authStream => authController.stream;

  final userRepository = UserRepository();
  bool _isSigned = false;
  bool get isSigned => _isSigned;

  signUpWithAccount(LoginModel loginModel) async {
    await userRepository
        .login(loginModel.userName, loginModel.password)
        .then((value) => {authSink.add(value), _isSigned = true})
        .catchError((onError) => {
              authenticationBloc.authController
                  .addError('Invalid account. Try again.'),
            });
  }

  void dispose() {
    authController.close();
  }
}

final AuthenticationBloc authenticationBloc = AuthenticationBloc();
