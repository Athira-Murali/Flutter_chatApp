import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.context,
      required this.onPressed,
      required this.title})
      : super(key: key);

  final BuildContext context;
  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Material(
      elevation: 5,
       borderRadius: BorderRadius.circular(20),
     color: Colors.purpleAccent,
      child: MaterialButton(
          onPressed: onPressed,
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
