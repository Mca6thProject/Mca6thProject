import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../login/input_border.dart';
import 'controller/auth_controller.dart';
import 'controller/login_sceen_controller.dart';
import 'signup_screen.dart';
import 'widget/auth_button.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final email = TextEditingController();
    final password = TextEditingController();
    // final _name = TextEditingController();
    //final _phone = TextEditingController();
    // final _bio = TextEditingController();
    final isLoading = useState<bool>(false);

    final auth = ref.watch(authenticationProvider);

    return Scaffold(
        body: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 14),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 0,
              ),
              //  const Spacer(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.abc,
                  size: 60,
                ),
              ),
              //  homeScreenTitle(),
              const SizedBox(
                height: 50,
              ),
              Flexible(
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    enableSuggestions: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    decoration: textFieldInputDecoration('Password'),
                    //  const InputDecoration(
                    //   hintText: 'Password',
                    //   hintStyle: TextStyle(color: Colors.black54),
                    //   border: OutlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.black54),
                    //   ),
                    // ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'password  is too short!';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              isLoading.value
                  ? const CircularProgressIndicator()
                  : InkWell(
                      // color: Colors.grey.shade600,
                      onTap: (() {
                        if (formKey.currentState!.validate()) {
                          isLoading.value = true;
                          // print('valid');
                          auth
                              .signInWithEmailAndPassword(
                                  email.text, password.text, context)
                              .whenComplete(() => isLoading.value = false);

                          // ref.read(currentUserControllerProvider);
                        }
                      }),
                      radius: 6,
                      child: authButton('Login', isMainButton: true)),

              const Flexible(
                child: SizedBox(
                  height: 50,
                ),
              ),
              TextButton(
                  onPressed: () {
                    ref.read(loginScreenController.state).state =
                        const SignUpScreen();
                  },
                  child: const Text('Don\'t have an account?')),
            ],
          ),
        ),
      ),
    ));
  }
}
