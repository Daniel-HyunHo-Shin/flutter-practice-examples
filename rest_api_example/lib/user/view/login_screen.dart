import 'package:flutter/material.dart';
import 'package:rest_api_example/common/component/custom_text_form_field.dart';

class LoginSceen extends StatelessWidget {
  const LoginSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            onChanged: (String value) {},
            obscureText: true,
            hintText: '비밀번호를 입력해 주요',
          ),
        ],
      ),
    );
  }
}
