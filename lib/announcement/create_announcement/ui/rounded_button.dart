import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function() onpressed;
  final bool isSmall;
  const RoundedButton(
      {Key? key,
      required this.title,
      required this.onpressed,
      this.isSmall = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 14,
      borderRadius: BorderRadius.circular(20),
      color: Colors.teal,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        // highlightColor: Colors.yellow,
        //  splashColor: Colors.green,
        //  focusColor: Colors.amber,
        hoverColor: Colors.lightBlueAccent.shade700,
        onTap: onpressed,
        child: Container(
            alignment: Alignment.center,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Colors.transparent),
            height: isSmall ? 28 : 36,
            width: isSmall ? 70 : 80,
            child: Text(
              title.toUpperCase(),
              // style: isSmall
              //     ? primaryTextStyle(color: Colors.white, size: 14)
              //     : boldTextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
