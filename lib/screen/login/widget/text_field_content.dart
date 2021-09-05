import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/layout/bottom_nav_bar.dart';
import 'package:shoppingapp/screen/login/bloc/cubit.dart';
import 'package:shoppingapp/screen/login/bloc/states.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';
import 'package:shoppingapp/shared/network/local/shared_helper/shared_helper.dart';

class TextFieldContent extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccessDataLoginStates) {
          if (state.loginModel.status!) {
            SharedHelper.setData(
              key: "login",
              value: state.loginModel.data!.token,
            ).then((value) {
              if (value) {
                token = state.loginModel.data!.token;

                finishedPush(screen: BottomNavBar(), ctx: context);
              }
            }).catchError((error) {
              print(error);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.loginModel.message!),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.loginModel.message!),
              backgroundColor: Colors.red,
            ));
          }
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: state is! LoadingDataLoginStates
              ? Column(
                  children: [
                    defaultTextFormField(
                      control: emailController,
                      keyType: TextInputType.emailAddress,
                      textTitle: "Email Address",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultTextFormField(
                      control: passwordController,
                      keyType: TextInputType.visiblePassword,
                      textTitle: "Password",
                      isPass: true,
                      isShowPassword: LoginCubit.of(context).isShowPassword,
                      onpressed: () => LoginCubit.of(context).passwordChange(),
                      icon: Icons.visibility,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This is required field!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          print(passwordController.text);
                          if (_formKey.currentState!.validate()) {
                            LoginCubit.of(context).login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        child: Text(
                          "Login",
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: ColorTheme.primaryColorTheme,
                        ),
                      ),
                    )
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorTheme.primaryColorTheme,
                  ),
                ),
        );
      },
    );
  }
}
