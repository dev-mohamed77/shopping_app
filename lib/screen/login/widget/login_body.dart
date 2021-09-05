import 'package:flutter/material.dart';
import 'package:shoppingapp/screen/login/widget/text_field_content.dart';
import 'package:shoppingapp/screen/register/register._screen.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey,",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Login Now.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "If you are new /",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                TextButton(
                  onPressed: () {
                    pushAndBack(screen: RegisterScreen(), ctx: context);
                  },
                  child: Text("Create Now"),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextFieldContent(),
          ],
        ),
      ),
    );
  }
}
