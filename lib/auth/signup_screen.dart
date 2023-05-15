import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instinfo/auth/title.dart';

import '../page_nav/bottom_tab.dart';
import '../utils/tools/utils.dart';
import 'controller/login_sceen_controller.dart';
import 'login/auth_button.dart';
import 'login/input_border.dart';
import 'login/login_screen.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  // filePick() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     platformFile = result.files.first;
  //   } else {
  //     return null;
  //     // User canceled the picker
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final email = TextEditingController();
    final password = TextEditingController();
    final name = TextEditingController();
    final phNo = TextEditingController();
    final regNo = TextEditingController();
    final bio = TextEditingController();
    final isLoading = useState<bool>(false);

    List<int> list = '111'.codeUnits;
    Uint8List bytes = Uint8List.fromList(list);
    final imageController = useState<Uint8List>(bytes);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      ScreenTitle('User \nRegistration'),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //  const Spacer(),
                  TextFormField(
                    controller: name,
                    enableSuggestions: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    decoration: textFieldInputDecoration('Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    controller: regNo,
                    enableSuggestions: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    decoration: textFieldInputDecoration('Email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    controller: email,
                    enableSuggestions: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    decoration:
                        textFieldInputDecoration('NIELIT Registration No.'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Registration No.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    controller: phNo,
                    enableSuggestions: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    decoration: textFieldInputDecoration('Phone No'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Phone No.!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: password,
                    enableSuggestions: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    decoration: textFieldInputDecoration('Password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'password  is too short!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    obscureText: true,
                    // controller: _name,
                    //  autocorrect: true,
                    enableSuggestions: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    decoration: textFieldInputDecoration('Confirm Password'),
                    validator: (value) {
                      if (value!.isEmpty || value != password.text) {
                        return 'password not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  isLoading.value
                      ? const CircularProgressIndicator()
                      : InkWell(
                          // color: Colors.grey.shade600,
                          onTap: (() {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RootPage()));
                          }),
                          radius: 6,
                          child: authButton('Sign Up', isMainButton: true),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        ref.read(loginScreenController.state).state =
                            const LoginScreen();
                      },
                      child: const Text(
                        'Already have an account?',
                      )),
                  // const Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
