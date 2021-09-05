import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/screen/login/login_screen.dart';
import 'package:shoppingapp/screen/register/bloc/cubit.dart';
import 'package:shoppingapp/screen/register/bloc/states.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';

class RegisterTextFieldContent extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is SuccessDataRegisterStates) {
          if (state.loginAndRegisterModel.status!) {
            finishedPush(screen: LoginScreen(), ctx: context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.loginAndRegisterModel.message!),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.loginAndRegisterModel.message!),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return state is! LoadingDataRegisterStates
            ? Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    defaultTextFormField(
                      control: nameController,
                      keyType: TextInputType.name,
                      textTitle: "Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This is required field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultTextFormField(
                      control: phoneController,
                      keyType: TextInputType.phone,
                      textTitle: "Phone",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This is required field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultTextFormField(
                      control: emailController,
                      keyType: TextInputType.emailAddress,
                      textTitle: "Email Address",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This is required field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultTextFormField(
                      control: passwordController,
                      keyType: TextInputType.visiblePassword,
                      textTitle: "Password",
                      icon: Icons.visibility,
                      onpressed: () =>
                          RegisterCubit.of(context).changePassword(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This is required field";
                        }
                        return null;
                      },
                      isPass: true,
                      isShowPassword: RegisterCubit.of(context).isShowPass,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                          child: Text("Sign Up"),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              RegisterCubit.of(context).register(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                              );

                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: Text("Sign Up Success")));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: ColorTheme.primaryColorTheme,
                          )),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: ColorTheme.primaryColorTheme,
                ),
              );
      },
    );
  }
}
