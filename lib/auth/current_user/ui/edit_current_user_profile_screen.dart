import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../authencation/widget/auth_button.dart';
import '../../authencation/widget/input_border.dart';
import '../../user_model.dart';
import '../controller/current_user_controller_provider.dart';
import 'widget/back_button.dart';

class EditCurrentUserProfileScreen extends HookConsumerWidget {
  final UserModel userModel;
  const EditCurrentUserProfileScreen(this.userModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userData = ref.watch(authStateControllerProvider);
    final GlobalKey<FormState> formKey = GlobalKey();
    final name = TextEditingController(text: userModel.name);
    final bio = TextEditingController(text: userModel.status);
    final phoneNo = TextEditingController(text: userModel.phno);
    final address = TextEditingController(text: userModel.address);
    final course = TextEditingController(text: userModel.course);
    final regNo = TextEditingController(text: userModel.regNo);
    final semester = TextEditingController(text: userModel.semester);
    final isLoading = useState<bool>(false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.only(left: 4.0),
              child: Text(
                'Edit Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            actions: [backButton(context), const SizedBox(width: 16)],
          ),
          body: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: name,
                      //  initialValue: userModel.userName,
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
                      height: 20,
                    ),
                    TextFormField(
                      controller: phoneNo,
                      // initialValue: userModel.bio,
                      enableSuggestions: true,
                      // maxLines: 4,
                      // minLines: 1,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {},
                      decoration: textFieldInputDecoration('Phone No'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your bio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: address,
                      // initialValue: userModel.bio,
                      enableSuggestions: true,
                      maxLines: 4,
                      minLines: 1,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {},
                      decoration: textFieldInputDecoration('Address'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your bio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: course,
                      // initialValue: userModel.bio,
                      enableSuggestions: true,
                      maxLines: 4,
                      minLines: 1,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {},
                      decoration: textFieldInputDecoration('Course'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your bio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: semester,
                      // initialValue: userModel.bio,
                      enableSuggestions: true,
                      maxLines: 4,
                      minLines: 1,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {},
                      decoration: textFieldInputDecoration('Semester'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your bio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: regNo,
                      // initialValue: userModel.bio,
                      enableSuggestions: true,
                      maxLines: 4,
                      minLines: 1,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {},
                      decoration: textFieldInputDecoration('Registration No.'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your bio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    isLoading.value
                        ? const CircularProgressIndicator()
                        : InkWell(
                            // color: Colors.grey.shade600,
                            onTap: (() {
                              if (formKey.currentState!.validate()) {
                                isLoading.value = true;
                                //print('valid');
                                // print(name.text);
                                ref
                                    .read(
                                        currentUserControllerProvider.notifier)
                                    .eiditProfile(UserModel(
                                        id: userModel.id,
                                        name: name.text,
                                        status: userModel.status,
                                        email: userModel.email,
                                        phno: phoneNo.text,
                                        address: address.text,
                                        course: course.text,
                                        regNo: regNo.text,
                                        semester: semester.text,
                                        userType: userModel.userType,
                                        isBlock: userModel.isBlock));
                                // ref
                                //     .read(currentUserControllerProvider.notifier)
                                //     .getUser(userModel.userId);
                                isLoading.value = false;
                                Navigator.of(context).pop();
                              }
                            }),
                            radius: 6,
                            child: authButton('Save', isMainButton: true),
                          ),
                  ]),
                ),
              ))),
    );
  }
}
