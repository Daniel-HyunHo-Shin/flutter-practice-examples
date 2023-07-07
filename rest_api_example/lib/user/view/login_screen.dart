import 'package:flutter/material.dart';
import 'package:rest_api_example/common/component/custom_text_form_field.dart';
import 'package:rest_api_example/common/const/colors.dart';
import 'package:rest_api_example/common/layout/default_layout.dart';

class LoginSceen extends StatelessWidget {
  const LoginSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Title(),
                const SizedBox(height: 16.0),
                const _SubTitle(),
                Image.asset(
                  'asset/img/misc/logo.png',
                ),
                CustomTextFormField(
                  onChanged: (String value) {},
                  obscureText: true,
                  hintText: '이메일을 입력해 주세요',
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  onChanged: (String value) {},
                  obscureText: true,
                  hintText: '비밀번호를 입력해 주세요',
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: const Text('로그인'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(color: primaryColor),
                  ),
                  child: const Text(
                    '회원가입',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '환영합니다',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '이메일과 비밀번호를 이용하여 로그인 해주세요!\n오늘도 좋은 하루 되세요!',
      style: TextStyle(
        fontSize: 16,
        color: bodyTextColor,
      ),
    );
  }
}
