import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthButton extends HookConsumerWidget {
  final String text = 'Continue';
  final double width = double.infinity;
  final double height = 44;
  final Color color = Colors.blue;
  final bool isMainButton = false;
  const AuthButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: isMainButton ? height + 4 : height,
      child: Container(
          decoration: BoxDecoration(
            color: isMainButton ? Colors.blue : Colors.white,
            border: Border.all(
              width: 2,
              color: isMainButton ? Colors.white : Colors.grey.shade800,
            ),
            borderRadius: BorderRadius.circular(6),
            //color: Colors.purple,
          ),
          height: 50,
          width: width,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: isMainButton ? Colors.white : Colors.grey.shade800),
            ),
          )),
    );
  }
}

Widget authButton(String text,
    {double width = double.infinity,
    double height = 44,
    Color color = const Color(0xFF26A69A),
    bool isMainButton = false,
    Color texcolor = Colors.white}) {
  return SizedBox(
    height: height,
    child: Container(
        decoration: BoxDecoration(
          color: isMainButton ? color : Colors.white,
          // border: Border.all(
          //   width: 2,
          //   color: isMainButton ? Colors.blue : Colors.grey.shade800,
          // ),
          borderRadius: BorderRadius.circular(6),
          //color: Colors.purple,
        ),
        height: 54,
        width: width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: isMainButton ? 18 : 16,
                color: isMainButton ? texcolor : Colors.grey.shade700),
          ),
        )),
  );
}
