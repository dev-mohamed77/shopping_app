import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppingapp/model/login_register/login_model.dart';
import 'package:shoppingapp/model/profile_model/profile_model.dart';
import 'package:shoppingapp/model/profile_model/profile_put.dart';
import 'package:shoppingapp/screen/login/bloc/states.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';
import 'package:shoppingapp/shared/network/remote/dio_helper/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginStates());

  static LoginCubit of(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void passwordChange() {
    isShowPassword = !isShowPassword;
    emit(PasswordChangeLoginStates());
  }

  LoginAndRegisterModel? loginModel;

  void login({
    required String email,
    required String password,
  }) {
    emit(LoadingDataLoginStates());
    DioHelper.postData(
      url: "login",
      lang: "en",
      query: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      loginModel = LoginAndRegisterModel.formJson(value.data);
      emit(SuccessDataLoginStates(loginModel!));
    }).catchError((error) {
      print("Error = ${error.toString()}");
      emit(ErorrDataLoginStates());
    });
  }

  ProfileModel? profileModel;

  void getProfile() {
    emit(LoadingGetProfileLoginStates());
    DioHelper.getData(
      url: "profile",
      token: token,
    ).then(
      (value) {
        profileModel = ProfileModel.fromJson(value.data);
        print(profileModel!.data!.name!);
        emit(SuccessGetProfileLoginStates());
      },
    ).catchError(
      (error) {
        print(error);
        emit(ErorrGetProfileLoginStates());
      },
    );
  }

  ProfileUpdataModel? profileUpdataModel;

  void updataProfile({
    required String name,
    required String email,
    required String phone,
    String? image,
  }) {
    emit(LoadingPutProfileLoginStates());
    DioHelper.putData(
      url: "update-profile",
      query: {
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
      },
      lang: "en",
      token: token,
    ).then((value) {
      profileUpdataModel = ProfileUpdataModel.fromjson(value.data);
      if (profileUpdataModel!.status!) {
        getProfile();
      }
      emit(SuccessPutProfileLoginStates());
    }).catchError((error) {
      print(error);
      emit(ErorrPutProfileLoginStates());
    });
  }

  // get Image picker

  File? image;

  Future uploadProfileImage({
    required ImageSource source,
  }) async {
    try {
      final pickerFile = await ImagePicker().pickImage(source: source);
      if (pickerFile != null) {
        image = File(pickerFile.path);
        emit(SuccessPutProfileImageLoginStates());
      } else {
        print("No Image Select");
      }
    } on PlatformException catch (e) {
      print("Faild to Pick Image $e");
    }
  }
}
