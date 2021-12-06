import 'package:flutter/material.dart';
import 'constants.dart';

class Bottombutton extends StatelessWidget {

Bottombutton({@required this.ontap,@required this.buttonTitle});
final Function  ontap;
final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: KlARGEBUTTONtEXT,)),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}