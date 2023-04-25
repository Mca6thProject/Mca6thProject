import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../tools/utils.dart';
import 'controller/auth_controller.dart';
import 'controller/login_sceen_controller.dart';
import 'login_screen.dart';
import 'widget/auth_button.dart';
import 'widget/input_border.dart';

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
    //final _phone = TextEditingController();
    final bio = TextEditingController();
    final isLoading = useState<bool>(false);
    final auth = ref.watch(authenticationProvider);
    // Uint8List? image;
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     Uint8List im = await pickImage(ImageSource.gallery);

                  //     imageController.value = im;
                  //   },
                  //   child: imageController.value != bytes
                  //       ? CircleAvatar(
                  //           radius: 64,
                  //           backgroundImage: MemoryImage(imageController.value),
                  //           // backgroundColor: Colors.red,
                  //         )
                  //       : CircleAvatar(
                  //           radius: 64,
                  //           backgroundColor: Colors.grey.shade200,
                  //           child: const Icon(
                  //             Icons.add_a_photo,
                  //             size: 64,
                  //             color: Colors.grey,
                  //           ),
                  //         ),
                  // ),

                  const SizedBox(
                    height: 18,
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
                    controller: email,
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
                            if (formKey.currentState!.validate()) {
                              isLoading.value = true;
                              //  print('valid');
                              if (imageController.value != bytes) {
                                auth
                                    .signUpWithEmailAndPassword(
                                      imageController.value,
                                      email.text,
                                      password.text,
                                      name.text,
                                      bio.text,
                                      context,
                                    )
                                    .whenComplete(
                                        () => isLoading.value = false);
                              } else {
                                isLoading.value = false;
                                showSnackBar(context, 'Please select image');
                              }
                            }
                          }),
                          radius: 6,
                          child: authButton('Sign Up', isMainButton: true),
                          // textColor: Colors.white,
                          //    textTheme: ButtonTextTheme.primary,
                          // minWidth: 100,
                          // padding: const EdgeInsets.all(18),
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(4),
                          //   // side: BorderSide(color: Colors.blue.shade700),
                          // ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        ref.read(loginScreenController.state).state =
                            const LoginScreen();
                      },
                      child: const Text('Already have an account?')),
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
