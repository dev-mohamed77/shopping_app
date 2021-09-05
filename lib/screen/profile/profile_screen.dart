import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppingapp/screen/login/bloc/cubit.dart';
import 'package:shoppingapp/screen/login/bloc/states.dart';
import 'package:shoppingapp/screen/profile/widget/profile_image.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';

class ProfileScreen extends StatelessWidget {
  final LoginCubit loginCubit;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ProfileScreen({required this.loginCubit});

  @override
  Widget build(BuildContext context) {
    emailController.text = loginCubit.profileModel!.data!.email!;
    nameController.text = loginCubit.profileModel!.data!.name!;
    phoneController.text = loginCubit.profileModel!.data!.phone!;
    // passwordController.text = loginCubit.profileModel!.data!.
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (state is LoadingPutProfileLoginStates)
                      LinearProgressIndicator(
                        color: ColorTheme.primaryColorTheme,
                      ),
                    ProfileImage(
                      loginCubit: loginCubit,
                      emailController: emailController,
                      phoneController: phoneController,
                      nameController: nameController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          defaultTextFormField(
                            control: emailController,
                            keyType: TextInputType.emailAddress,
                            textTitle: "Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This is required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          defaultTextFormField(
                            control: nameController,
                            keyType: TextInputType.name,
                            textTitle: "Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This is required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          defaultTextFormField(
                            control: phoneController,
                            keyType: TextInputType.phone,
                            textTitle: "Phone",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This is required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // defaultTextFormField(
                          //   control: passwordController,
                          //   keyType: TextInputType.visiblePassword,
                          //   textTitle: "Password",
                          //   validator: (value) {},
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  loginCubit.updataProfile(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    // password: passwordController.text,
                                    // image: image,
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.users,
                                    color: ColorTheme.whiteColorTheme,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Updata Profile",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: ColorTheme.whiteColorTheme,
                                          fontSize: 20,
                                        ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: ColorTheme.primaryColorTheme,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
