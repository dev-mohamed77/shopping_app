import 'package:shoppingapp/model/login_register/login_model.dart';

abstract class RegisterStates {}

class InitialRegisterStates extends RegisterStates {}

class PasswordChangeRegisterStates extends RegisterStates {}

class LoadingDataRegisterStates extends RegisterStates {}

class SuccessDataRegisterStates extends RegisterStates {
  LoginAndRegisterModel loginAndRegisterModel;
  SuccessDataRegisterStates(this.loginAndRegisterModel);
}

class ErrorDataRegisterStates extends RegisterStates {}
