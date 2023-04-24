// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instinfo/announcement/create_notice/ui/rounded_button.dart';
import '../../../tools/utils.dart';
import '../controller.dart/notice_controller.dart';
import '../notice_model.dart';
import '../utls.dart';
import 'widget/rounded_container.dart';
import 'widget/star_text.dart';

class Createnotice extends HookConsumerWidget {
  const Createnotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    List<int> list = '111'.codeUnits;

    final imageController = useState<Uint8List>(bytes1);
    final name = useState<TextEditingController>(TextEditingController());
    final description =
        useState<TextEditingController>(TextEditingController());
    final place = useState<TextEditingController>(TextEditingController());
    final whatsappLink =
        useState<TextEditingController>(TextEditingController());
    final phoneNo = useState<TextEditingController>(TextEditingController());
    final otherLink = useState<TextEditingController>(TextEditingController());
    final ticketPrice =
        useState<TextEditingController>(TextEditingController(text: '0'));
    final startDate = useState<TextEditingController>(
        TextEditingController(text: DateTime.now().toString()));
    final endDate = useState<TextEditingController>(
        TextEditingController(text: DateTime.now().toString()));
    final formKey = GlobalKey<FormState>();
    // TimeOfDay time = TimeOfDay.now().replacing(hour: 11, minute: 30);
    Widget sizedBoxH() => const SizedBox(
          height: 12,
        );
    final upiId = useState<TextEditingController>(TextEditingController());
    //final directJoin = useState(false);
    final verifyParticipant = useState(false);
    final requiredPayment = useState(false);
    final requiredTicket = useState(false);
    final verifyState = useState('yes');
    final pickTextColor = useState(Colors.black);
    final currentTextColor = useState(Colors.black);
    // List<int> list = '111'.codeUnits;
    // Uint8List bytes = Uint8List.fromList(list);
    // final imageController = useState<Uint8List>(bytes);
    // final userData = ref.watch(currentUserControllerProvider);
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(children: [
              Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 14),
                  //width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // const SizedBox(
                      //   height: 6,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Create notice'),

                          // )
                        ],
                      ),
                      const SizedBox(height: 40),
                      starText(),
                      GestureDetector(
                        onTap: () async {
                          Uint8List im = await pickImage(ImageSource.gallery);

                          imageController.value = im;
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                            color: Colors.transparent,
                            child: imageController.value != bytes1
                                ? ExtendedImage.memory(
                                    imageController.value,
                                    height: 215,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  )
                                : CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.grey.shade200,
                                    child: const Icon(
                                      Icons.add_a_photo,
                                      size: 64,
                                      color: Colors.grey,
                                    ),
                                  ),
                          ),
                        ),
                      ),

                      GestureDetector(
                          onTap: () {
                            print(imageController.value.buffer.asUint8List());
                          },
                          child: starText()),

                      // sizedBoxH(),
                      starText(),
                      TextFormField(
                        controller: name.value,
                        enableSuggestions: true,
                        onSaved: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter notice name';
                          }
                          return null;
                        },
                      ),

                      sizedBoxH(),
                      TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        controller: description.value,
                        enableSuggestions: true,
                        onSaved: (value) {},
                        //  decoration: textFieldInputDecoration('Description'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter description';
                          }
                          return null;
                        },
                      ),
                      sizedBoxH(),
                      TextFormField(
                        controller: whatsappLink.value,
                        //  autocorrect: true,
                        enableSuggestions: true,
                        //  keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {},

                        //  textFieldInputDecoration('Whatsapp group link'),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return '';
                        //   }
                        //   return null;
                        // },
                      ),
                      //sizedBoxH(),
                      //
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: roundedContainer(
                          w: MediaQuery.of(context).size.width - 10,
                          h: 50,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 4,
                              ),
                              const Text('Open notice'),
                              const Spacer(),
                              Radio(
                                  value: 'yes',
                                  groupValue: verifyState.value,
                                  onChanged: (val) {
                                    verifyState.value = val.toString();
                                  }),
                              const Text('Yes'),
                              const SizedBox(
                                width: 4,
                              ),
                              Radio(
                                  value: 'no',
                                  groupValue: verifyState.value,
                                  onChanged: (val) {
                                    verifyState.value = val.toString();
                                  }),
                              const Text('No'),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (verifyState.value == 'no')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: GestureDetector(
                                child: roundedContainer(
                                  w: MediaQuery.of(context).size.width - 10,
                                  h: 50,
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: verifyParticipant.value,
                                          onChanged: (_) {
                                            verifyParticipant.value = _!;
                                          }),
                                      const Text('Verify Participant'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: roundedContainer(
                                w: MediaQuery.of(context).size.width - 10,
                                h: 50,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: requiredPayment.value,
                                        onChanged: (_) {
                                          requiredPayment.value = _!;
                                        }),
                                    const Text(
                                        'Required payment to joint the notice'),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: roundedContainer(
                                w: MediaQuery.of(context).size.width - 10,
                                h: 50,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: requiredTicket.value,
                                        onChanged: (_) {
                                          requiredTicket.value = _!;
                                        }),
                                    const Text('Required Ticket'),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //
                          ],
                        ),
//
                      //
                      //
                      const SizedBox(
                        height: 20,
                      ),
                      //

                      ///
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
        Positioned(
          right: 12,
          top: 12,
          child: RoundedButton(
              title: 'CREATE',
              onpressed: (() {
                if (formKey.currentState!.validate()) {
                  if (DateTime.parse(startDate.value.text)
                      .isAfter(DateTime.parse(endDate.value.text))) {
                    ref.read(noticeCreateAndUpdateErrorMessage.state).state =
                        'start date cannot be preceded by end date';
                  } else {
                    ref.read(noticeCreateAndUpdateErrorMessage.state).state =
                        '';
                    ref.read(noticeController.notifier).createnotice(
                        Notice(
                            id: "i",
                            title: 'title',
                            subtitle: 'subtitle',
                            body: 'body',
                            link: 'link',
                            date: 'date',
                            others: 'others',
                            img: 'img'),
                        imageController.value);
                    //  ref.read(mynoticeController.notifier).refresh();
                  }
                  //
                }
              })),
        )
      ],
    );
  }
}
