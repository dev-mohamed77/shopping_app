import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppingapp/screen/login/bloc/cubit.dart';
import 'package:shoppingapp/shared/constant/theme/color_theme.dart';

class ProfileImage extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final LoginCubit loginCubit;

  ProfileImage(
      {required this.loginCubit,
      required this.emailController,
      required this.nameController,
      required this.phoneController});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 230,
      // color: Colors.red,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundImage: loginCubit.image != null
                    ? FileImage(loginCubit.image!)
                    : NetworkImage(loginCubit.profileModel!.data!.image!)
                        as ImageProvider,
                backgroundColor: ColorTheme.primaryColorTheme,
                radius: 65,
              ),
              CircleAvatar(
                backgroundColor: ColorTheme.primaryColorTheme,
                radius: 20,
                child: IconButton(
                  onPressed: () {
                    dialog(context, loginCubit);
                  },
                  alignment: Alignment.center,
                  icon: Icon(
                    FontAwesomeIcons.camera,
                    color: ColorTheme.whiteColorTheme,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            loginCubit.profileModel!.data!.name!,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 19),
          ),
          SizedBox(
            height: 10,
          ),
          if (loginCubit.image != null)
            OutlinedButton(
              onPressed: () {
                loginCubit.updataProfile(
                  email: emailController.text,
                  name: nameController.text,
                  phone: phoneController.text,
                  image: loginCubit.image!.path,
                );
              },
              child: Text(
                "Save Image",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: ColorTheme.primaryColorTheme,
                      fontSize: 18,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}

void dialog(context, LoginCubit loginCubit) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Selected Image"),
        content: Container(
          width: 300,
          height: 120,
          child: Column(
            children: [
              BuildOnClickImageButton(
                onClick: () {
                  loginCubit
                      .uploadProfileImage(
                    source: ImageSource.gallery,
                  )
                      .then((value) {
                    Navigator.pop(context);
                    print(value);
                  });
                },
                buttonName: 'Galary',
              ),
              SizedBox(
                height: 15,
              ),
              BuildOnClickImageButton(
                onClick: () {
                  loginCubit
                      .uploadProfileImage(source: ImageSource.camera)
                      .then((value) {
                    Navigator.pop(context);
                    print(value);
                  });
                },
                buttonName: "Camera",
              ),
            ],
          ),
        ),
      );
    },
  );
}

class BuildOnClickImageButton extends StatelessWidget {
  final void Function()? onClick;
  final String buttonName;

  BuildOnClickImageButton({required this.onClick, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onClick,
        child: Text(buttonName),
        style: ElevatedButton.styleFrom(
          primary: ColorTheme.primaryColorTheme,
        ),
      ),
    );
  }
}
