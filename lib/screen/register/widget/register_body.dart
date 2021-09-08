import 'package:flutter/material.dart';
import 'package:shoppingapp/screen/register/widget/register_text_field_content.dart';

class RegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Hey,",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Register Now.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 50,
            ),
            RegisterTextFieldContent()
          ],
        ),
      ),
    );
  }
}
