import 'constant.dart';
import 'package:flutter/material.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeKey,
          ),
        ),
        color: Color(0Xffff0749),
        margin: EdgeInsets.only(top: 5.0),
        height: 80.0,
        width: double.infinity,
      ),
    );
  }
}
