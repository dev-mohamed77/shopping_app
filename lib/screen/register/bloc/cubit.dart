import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/model/login_register/login_model.dart';
import 'package:shoppingapp/screen/register/bloc/states.dart';
import 'package:shoppingapp/shared/network/remote/dio_helper/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterStates());
  static RegisterCubit of(context) => BlocProvider.of(context);

  bool isShowPass = true;

  void changePassword() {
    isShowPass = !isShowPass;
    emit(PasswordChangeRegisterStates());
  }

  LoginAndRegisterModel? loginAndRegisterModel;

  void register({
    required String? name,
    required String? email,
    required String? phone,
    required String? password,
  }) {
    emit(LoadingDataRegisterStates());
    DioHelper.postData(
      url: "register",
      query: {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      },
    ).then(
      (value) {
        loginAndRegisterModel = LoginAndRegisterModel.formJson(value.data);
        print(loginAndRegisterModel!.message);
        emit(SuccessDataRegisterStates(loginAndRegisterModel!));
      },
    ).catchError(
      (error) {
        print(error);
        emit(ErrorDataRegisterStates());
      },
    );
  }
}
