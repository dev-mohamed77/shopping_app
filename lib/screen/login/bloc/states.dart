import 'package:shoppingapp/model/login_register/login_model.dart';

abstract class LoginStates {}

class InitialLoginStates extends LoginStates {}

class PasswordChangeLoginStates extends LoginStates {}

class LoadingDataLoginStates extends LoginStates {}

class SuccessDataLoginStates extends LoginStates {
  LoginAndRegisterModel loginModel;
  SuccessDataLoginStates(this.loginModel);
}

class ErorrDataLoginStates extends LoginStates {}

class LoadingGetProfileLoginStates extends LoginStates {}

class SuccessGetProfileLoginStates extends LoginStates {}

class ErorrGetProfileLoginStates extends LoginStates {}

class LoadingPutProfileLoginStates extends LoginStates {}

class SuccessPutProfileLoginStates extends LoginStates {}

class ErorrPutProfileLoginStates extends LoginStates {}

class SuccessPutProfileImageLoginStates extends LoginStates {}

class ErorrPutProfileImageLoginStates extends LoginStates {}
